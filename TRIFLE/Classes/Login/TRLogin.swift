//
//  TRLogin.swift
//  TRIFLE
//
//  Created by Yang on 2020/2/13.
//  Copyright © 2020 Yang. All rights reserved.
//

import UIKit
import Alamofire

class TRLogin: NSObject, TencentSessionDelegate{
    
    let appDel = UIApplication.shared.delegate as! AppDelegate
    
    func tencentDidLogin() {
//        let isLogin: Bool = appDel.tencentAuth.getUserInfo()
//        let rootVC : TRTabBarController = TRTabBarController()
//        rootVC.selectedIndex = 4
//        appDel.window?.rootViewController = rootVC
    }
    
    func tencentDidNotLogin(_ cancelled: Bool) {
        
    }
    
    func tencentDidNotNetWork() {
        
    }
    func getUserInfoResponse(_ response: APIResponse!) {
        if response.retCode == 0 {
            if let res = response.jsonResponse {
                var infodict : [String : String] = [String : String]()
                if let uid = appDel.tencentAuth.getUserOpenID() {
                    infodict["uid"] = uid
                }
                if let name = res["nickname"] {
                    infodict["nickname"] = name as? String
                }
                if let img = res["figureurl_qq_2"] {
                    infodict["iconImage"] = img as? String
                }
                let account = UserAccount(dict: infodict)
                // MARK: -发送网络更新用户数据
                NSKeyedArchiver.archiveRootObject(account, toFile: UserAccountViewModel.shareInstance.accountPath)
                UserAccountViewModel.shareInstance.account = account
            }
        }
        
    }

}
