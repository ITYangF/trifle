//
//  AppDelegate.swift
//  TRIFLE
//
//  Created by Yang on 2020/2/5.
//  Copyright © 2020 Yang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let rootVC : TRTabBarController = TRTabBarController()
        window?.rootViewController = rootVC
        
        window?.makeKeyAndVisible()
        return true
    }

}

