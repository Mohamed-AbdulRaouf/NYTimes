//
//  AppDelegate.swift
//  NYTimes
//
//  Created by Mohamed Abdul-Raouf on 13/01/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - Variables
    var window: UIWindow?
    
    // MARK: - Func
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setAppearance()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = NewsVCRouter.create().toNavigation
        window?.makeKeyAndVisible()
        return true
    }
}

