//
//  NewsVC.swift
//  NYTimes
//
//  Created by Mohamed Abdul-Raouf on 15/01/2022.
//

import UIKit
import RxSwift

class NewsVC: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var newsTableView: UITableView! {
        didSet{
            self.newsTableView.delegate = self
        }
    }
    
    // MARK: - Variables
    let viewModel = NewsViewModel()
    let disposeBag = DisposeBag()
    let router = NewsVCRouter()
    
    // MARK: - Func
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "New York Times"
        setupTableView()
        subscripeIsLoading()
        subscripeNews()
        getPopularNews()
    }
    
    func subscripeIsLoading(){
        self.viewModel.isLoadingBehavior.subscribe { (value) in
            if value.element! {
                self.startLoading()
            }else{
                self.stopLoading()
            }
        }.disposed(by: disposeBag)
    }
    
    func setupTableView(){
        newsTableView.rowHeight = UITableView.automaticDimension
        newsTableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil),
                               forCellReuseIdentifier: "NewsTableViewCell")
    }
    
    func getPopularNews() {
        viewModel.loadPopularNews()
    }
    
    func subscripeNews(){
        viewModel.newsObservable.bind(to: newsTableView.rx.items(cellIdentifier: "NewsTableViewCell" , cellType: NewsTableViewCell.self)) { index, model, cell in
            cell.setupCell(imageUrl: model.media?.first?.mediaMetadata?.first?.url,
                           title: model.title,
                           date: model.date)
        }.disposed(by: disposeBag)
    }
}
