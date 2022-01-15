//
//  UIViewController+ToNavigation.swift
//  NYTimes
//
//  Created by Mohamed Abdul-Raouf on 15/01/2022.
//

import UIKit

extension UIViewController {
    
    var toNavigation: UINavigationController {
        let navigateVC = UINavigationController(rootViewController: self)
        navigateVC.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        navigateVC.navigationBar.topItem?.backBarButtonItem?.tintColor = .white
        return navigateVC
    }
}
