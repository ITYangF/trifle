//
//  TRVisitView.swift
//  TRIFLE
//
//  Created by Yang on 2020/2/12.
//  Copyright © 2020 Yang. All rights reserved.
//

import UIKit
import SnapKit

class TRVisitView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.configureVisitiew()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureVisitiew(){
        
        let contentView = UIView()
        self.addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.center.equalToSuperview()
            make.height.equalTo(300)
        }
        
        
        let tipLabel = UILabel()
        contentView.addSubview(tipLabel)
        tipLabel.text = "完成登陆，可查看更多精彩内容"
        tipLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
        }
        
        let phoneLogin = UIButton(type: .custom)
        contentView.addSubview(phoneLogin)
        phoneLogin.setImage(UIImage(named: "icon_Phone"), for: UIControl.State.normal)
        phoneLogin.snp.makeConstraints { (make) in
            make.width.height.equalTo(48)
            make.bottom.equalToSuperview().offset(-10)
            make.centerX.equalToSuperview().offset(-48)
        }
        
        let qqLogin = UIButton(type: .custom)
        contentView.addSubview(qqLogin)
        qqLogin.setImage(UIImage(named: "icon_QQ"), for: UIControl.State.normal)
        qqLogin.snp.makeConstraints { (make) in
            make.width.height.equalTo(48)
            make.centerY.equalTo(phoneLogin.snp.centerY)
            make.left.equalTo(phoneLogin.snp.right).offset(48)
        }
        
        let textLabel = UILabel()
        contentView.addSubview(textLabel)
        textLabel.text = "请选择登陆方式"
        textLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(phoneLogin.snp.top).offset(-10)
            
        }
        let bgImageView = UIImageView()
        contentView.addSubview(bgImageView)
        bgImageView.image = UIImage(named: "circle")
        bgImageView.contentMode = .scaleAspectFit
        bgImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.centerX.equalToSuperview()
            make.top.equalTo(tipLabel.snp.bottom).offset(5)
            make.bottom.equalTo(textLabel.snp.top).offset(-5)
        }
        
        let rotationAnim = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnim.fromValue = NSNumber(value: 0)
        rotationAnim.toValue = NSNumber(value: Double.pi * 2)
        rotationAnim.repeatCount = MAXFLOAT
        rotationAnim.duration = 5
        rotationAnim.isRemovedOnCompletion = false
        bgImageView.layer.add(rotationAnim, forKey: nil)
        
        
        
        let iconImageView = UIImageView(image: UIImage(named: "dang"))
        contentView.addSubview(iconImageView)
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(bgImageView.snp.centerY)
        }
    }
}
