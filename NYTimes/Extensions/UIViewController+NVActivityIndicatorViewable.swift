//
//  UIViewController+NVActivityIndicatorViewable.swift
//  NYTimes
//
//  Created by Mohamed Abdul-Raouf on 15/01/2022.
//

import UIKit
import NVActivityIndicatorView

extension UIViewController: NVActivityIndicatorViewable {
    
    func startLoading() {
        let size = CGSize(width: 50, height: 50)
        NVActivityIndicatorView.DEFAULT_COLOR = #colorLiteral(red: 0.1176470588, green: 0.7843137255, blue: 0.9607843137, alpha: 1)
        NVActivityIndicatorView.DEFAULT_BLOCKER_BACKGROUND_COLOR = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        startAnimating(size, message: "", type: NVActivityIndicatorType.ballSpinFadeLoader)
    }
    
    func stopLoading() {
        stopAnimating()
    }
}
