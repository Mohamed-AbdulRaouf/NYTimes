//
//  NewsDetailsVC.swift
//  NYTimes
//
//  Created by Mohamed Abdul-Raouf on 15/01/2022.
//

import UIKit
import RxSwift
import ZKCarousel

class NewsDetailsVC: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var newsCarouselView: ZKCarousel!{
        didSet{
            newsCarouselView.delegate = self
        }
    }
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var byLineLbl: UILabel!
    @IBOutlet weak var subsectionLbl: UILabel!
    
    // MARK: - Variables
    var viewModel = NewsDetailsViewModel()
    let disposeBag = DisposeBag()
    
    // MARK: - Func
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "News Details"
        setupConfigurationNav()
        subscripeIsLoading()
        subscribeOnNewsDetails()
        viewModel.getData()
    }
    
    private func setupConfigurationNav() {
        self.navigationController?.navigationBar.topItem?.backBarButtonItem?.tintColor = .black
    }
    
    func subscripeIsLoading() {
        self.viewModel.isLoadingBehavior.subscribe { (value) in
            if value.element! {
                self.startLoading()
            }else{
                self.stopLoading()
            }
        }.disposed(by: disposeBag)
    }
    
    func subscribeOnNewsDetails() {
        viewModel.newsDetailsObservable.subscribe { (newsDetails) in
            self.titleLbl.text = "Title: \(newsDetails.element??.title ?? "")"
            self.byLineLbl.text = newsDetails.element??.byLine ?? ""
            
            if newsDetails.element??.subsection != "" {
                self.subsectionLbl.text = "Subsection: \(newsDetails.element??.subsection ?? "")"
            } else {
                self.subsectionLbl.isHidden = true
            }
            // append counts of images
            self.viewModel.getAllImages() { images in
                self.newsCarouselView.slides = images
                self.stopLoading()
            }
        }.disposed(by: disposeBag)
    }
}
