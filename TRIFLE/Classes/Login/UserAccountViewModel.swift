//
//  UserAccountViewModel.swift
//  TRIFLE
//
//  Created by Yang on 2020/2/25.
//  Copyright © 2020 Yang. All rights reserved.
//

import UIKit

class UserAccountViewModel {
    // MARK: -单例
    static let shareInstance : UserAccountViewModel = UserAccountViewModel()
    
    // MARK: -用户属性
    var account: UserAccount?
    
    // MARK: -存储地址
    var accountPath: String {
        let accountPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        return (accountPath as NSString).appendingPathComponent("account.plist")
    }
    
    // MARK: -登陆属性
    var isLogin: Bool {
        if account == nil {
            return false
        }
        return true
    }
    
    init() {
        account = NSKeyedUnarchiver.unarchiveObject(withFile: accountPath) as? UserAccount
    }
}
