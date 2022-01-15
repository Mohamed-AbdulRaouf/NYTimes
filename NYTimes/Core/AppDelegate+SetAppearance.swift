//
//  AppDelegate+SetAppearance.swift
//  NYTimes
//
//  Created by Mohamed Abdul-Raouf on 15/01/2022.
//

import UIKit

extension AppDelegate {
    func setAppearance() {
        setNavigationAppearance()
        setImageViewAppearance()
    }
    
    func setNavigationAppearance() {
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
            navBarAppearance.shadowColor = .clear
            navBarAppearance.backgroundColor = .white
            UINavigationBar.appearance().standardAppearance = navBarAppearance
            UINavigationBar.appearance().compactAppearance = navBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        } else {
            UINavigationBar.appearance().tintColor = .black
            UINavigationBar.appearance().shadowImage = UIImage()
            UINavigationBar.appearance().backgroundColor = UIColor.white
        }
    }
    
    func setImageViewAppearance() {
        UIImageView.appearance().contentMode = .scaleAspectFill
        UIImageView.appearance().clipsToBounds = true
    }
}
