//
//  TRUserView.swift
//  TRIFLE
//
//  Created by Yang on 2020/2/12.
//  Copyright © 2020 Yang. All rights reserved.
//

import UIKit

class TRUserView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUserView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUserView(){
        //头像
        let iconImageView = UIImageView()
        self.addSubview(iconImageView)
        iconImageView.image = UIImage(named: "user")
        iconImageView.contentMode = .scaleAspectFill
        //昵称
        let nickname = UILabel()
        self.addSubview(nickname)
        nickname.text = "22"
        //编辑个人资料/签名
        let signature = UILabel()
        self.addSubview(signature)
        signature.text = "编辑个人资料"
        
        iconImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(30)
            make.width.equalTo(60)
        }
        
        nickname.snp.makeConstraints { (make) in
            make.top.equalTo(iconImageView.snp.top)
            make.left.equalTo(iconImageView.snp.right).offset(10)
        }
        
        signature.snp.makeConstraints { (make) in
            make.left.equalTo(nickname.snp.left)
            make.top.equalTo(nickname.snp.bottom).offset(10)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
}
