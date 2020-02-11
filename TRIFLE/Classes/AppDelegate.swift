//
//  AppDelegate.swift
//  TRIFLE
//
//  Created by Yang on 2020/2/5.
//  Copyright © 2020 Yang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate ,TencentSessionDelegate{

    
    var window: UIWindow?
    var tencentAuth: TencentOAuth!
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let rootVC : TRTabBarController = TRTabBarController()
        window?.rootViewController = rootVC
        
        window?.makeKeyAndVisible()
        
        
        self.tencentAuth = TencentOAuth(appId: "1109847615", andDelegate: self)
        return true
    }
    
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        let urlKey: String = options[UIApplication.OpenURLOptionsKey.sourceApplication] as! String
        if urlKey == "com.tencent.mqq" {
            return  TencentOAuth.handleOpen(url)
        }
        return true
        
    }
    
    func tencentDidLogin() {
        self.tencentAuth.getUserInfo()
    }
    
    func tencentDidNotLogin(_ cancelled: Bool) {
        
    }
    
    func tencentDidNotNetWork() {
        
    }
    
    func getUserInfoResponse(_ response: APIResponse!) {
        if response.retCode == 0 {
        
            if let res = response.jsonResponse {
                             
                if let uid = self.tencentAuth.getUserOpenID() {
                   print(uid)
                }
                
                if let name = res["nickname"] {
                    print(name)
                }
                
                if let sex = res["gender"] {
                    print(sex)
                }
                
                if let img = res["figureurl_qq_2"] {
                    print(img)
                }
            }
        }
        
    }
}

