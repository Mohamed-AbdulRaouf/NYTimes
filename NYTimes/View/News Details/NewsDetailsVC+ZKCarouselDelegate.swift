//
//  NewsDetailsVC+ZKCarouselDelegate.swift
//  NYTimes
//
//  Created by Mohamed Abdul-Raouf on 15/01/2022.
//

import Foundation
import ZKCarousel
import RxSwift

extension NewsDetailsVC: ZKCarouselDelegate {
    
    func carouselDidScroll(currentIndex: Int) {
        self.viewModel.currentIndex.accept(currentIndex)
        self.viewModel.loadImageToCarousel() { image in
            self.newsCarouselView.slides[currentIndex] = ZKCarouselSlide(image: image)
        }
    }
}
