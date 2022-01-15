//
//  NewsViewModel.swift
//  NYTimes
//
//  Created by Mohamed Abdul-Raouf on 15/01/2022.
//

import RxSwift
import RxCocoa

class NewsViewModel {
    
    // MARK: - Variables
    private let networkManager: NetworkManager = NetworkManager()
    let newsSubject = BehaviorRelay<[PopularNews]>(value: [])
    var newsObservable : Observable<[PopularNews]>{
        return newsSubject.asObservable()
    }
    var isLoadingBehavior = BehaviorRelay<Bool>(value: true)
    
    // MARK: - Func
    func loadPopularNews(){
        networkManager.fetchPopularNews { [weak self] result in
            guard let self = self else { return }
            self.isLoadingBehavior.accept(false)
            switch result {
            case .success(let news):
                self.newsSubject.accept(news.results ?? [])
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
