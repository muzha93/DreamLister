//
//  AppDelegate.swift
//  DreamLister
//
//  Created by luka on 15/05/2017.
//  Copyright © 2017 luka. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let vc = HomeViewController(persistanceService: PersistanceService())
        
        window = UIWindow(frame:UIScreen.main.bounds)
        let nc = UINavigationController(rootViewController: vc)
        window?.rootViewController = nc
        window?.makeKeyAndVisible()
        return true
    }

}

