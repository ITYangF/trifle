//
//  UserInfo.swift
//  TRIFLE
//
//  Created by Yang on 2020/2/13.
//  Copyright © 2020 Yang. All rights reserved.
//

import UIKit

class UserAccount: NSObject ,NSCoding{
    
    var uid: String?        //id
    var nickname: String?   //昵称
    var iconImage: String?  //图像地址
    
    init(dict : [String : String]) {
        super.init()
        uid = dict["uid"]
        nickname = dict["nickname"]
        iconImage = dict["iconImage"]
    }
    
    //归档
    func encode(with coder: NSCoder) {
        coder.encode(uid, forKey: "uid")
        coder.encode(nickname, forKey: "nickname")
        coder.encode(iconImage, forKey: "iconImage")
    }
    //解档
    required init?(coder: NSCoder) {
        uid = coder.decodeObject(forKey: "uid") as? String
        nickname = coder.decodeObject(forKey: "nickname") as? String
        iconImage = coder.decodeObject(forKey: "iconImage") as? String
    }
    
    
}
