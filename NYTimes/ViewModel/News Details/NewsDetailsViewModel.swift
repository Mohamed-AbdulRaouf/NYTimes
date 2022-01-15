//
//  NewsDetailsViewModel.swift
//  NYTimes
//
//  Created by Mohamed Abdul-Raouf on 15/01/2022.
//

import RxSwift
import RxCocoa
import ZKCarousel

class NewsDetailsViewModel {
    
    // MARK: - Variables
    var currentIndex = BehaviorRelay<Int>(value: 0)
    private var newsDetails: PopularNews?
    var isLoadingBehavior = BehaviorRelay<Bool>(value: true)
    private let newsDetailsSubject = PublishSubject<PopularNews?>()
    var newsDetailsObservable : Observable<PopularNews?>{
        return newsDetailsSubject
    }
    
    // MARK: - Initializers
    internal init(popularNews: PopularNews? = nil) {
        self.newsDetails = popularNews
    }
    
    // MARK: - Func
    func getData() {
        self.isLoadingBehavior.accept(false)
        self.newsDetailsSubject.onNext(self.newsDetails)
    }
    
    func getUrlImage() -> String {
        return self.newsDetails?.media?.first?.mediaMetadata?[self.currentIndex.value].url ?? ""
    }
    
    func getAllImages(completion: @escaping ([ZKCarouselSlide])->()) {
        self.isLoadingBehavior.accept(true)
        var carouselSlide = [ZKCarouselSlide]()
        for mediaMetadata in self.newsDetails?.media?.first?.mediaMetadata ?? [] {
            let image = UIImageView()
            image.load(with: mediaMetadata.url ?? "")
            carouselSlide.append(ZKCarouselSlide(image: image.image!))
        }
        self.isLoadingBehavior.accept(false)
        completion(carouselSlide)
    }
    
    func loadImageToCarousel(complection: @escaping (UIImage)->()) {
        self.isLoadingBehavior.accept(true)
        let image = UIImageView()
        image.load(with: self.getUrlImage())
        complection(image.image!)
        self.isLoadingBehavior.accept(false)
    }
}
