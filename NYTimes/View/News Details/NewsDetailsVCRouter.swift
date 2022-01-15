//
//  NewsDetailsVCRouter.swift
//  NYTimes
//
//  Created by Mohamed Abdul-Raouf on 15/01/2022.
//

import UIKit

class NewsDetailsVCRouter {
    class func create(popularNews: PopularNews) -> UIViewController {
        let newsDetails = NewsDetailsVC()
        newsDetails.viewModel = NewsDetailsViewModel(popularNews: popularNews)
        return newsDetails
    }
}
