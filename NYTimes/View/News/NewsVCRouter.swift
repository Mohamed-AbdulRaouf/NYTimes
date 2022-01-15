//
//  NewsVCRouter.swift
//  NYTimes
//
//  Created by Mohamed Abdul-Raouf on 15/01/2022.
//

import UIKit

class NewsVCRouter {
    
    class func create() -> UIViewController {
        return NewsVC()
    }
    
    func navigateToNewsDetails(_ view: UIViewController, popularNews: PopularNews) {
        view.navigationController?.pushViewController(NewsDetailsVCRouter.create(popularNews: popularNews), animated: true)
    }
}
