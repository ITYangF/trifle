//
//  AppDelegate.swift
//  TRIFLE
//
//  Created by Yang on 2020/2/5.
//  Copyright © 2020 Yang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate{

    
    var window: UIWindow?
    var tencentAuth: TencentOAuth!
    var tencentAuthDelegate: TRLogin!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let rootVC : TRTabBarController = TRTabBarController()
        window?.rootViewController = rootVC
        
        window?.makeKeyAndVisible()
        
        self.tencentAuthDelegate = TRLogin()
        self.tencentAuth = TencentOAuth(appId: "1109847615", andDelegate: self.tencentAuthDelegate)
        return true
    }
    
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        let urlKey: String = options[UIApplication.OpenURLOptionsKey.sourceApplication] as! String
        if urlKey == "com.tencent.mqq" {
            return  TencentOAuth.handleOpen(url)
        }
        return true
        
    }
    
    
    
}

