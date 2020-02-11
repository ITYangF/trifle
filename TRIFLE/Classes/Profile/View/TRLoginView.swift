//
//  TRLoginView.swift
//  TRIFLE
//
//  Created by Yang on 2020/2/11.
//  Copyright © 2020 Yang. All rights reserved.
//

import UIKit
import SnapKit

// MARK: -登陆方式枚举
enum LoginMethod {
    case QQ
    case Phone
}

class TRLoginView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureLoginView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -初始化界面
    private func configureLoginView(){
        
        let textLabel = UILabel()
        textLabel.text = "尚未登陆，请选择登陆方式"
        self.addSubview(textLabel)
        textLabel.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.centerX.equalToSuperview()
        }
        
        
        let phoneImageView = UIImageView(image: UIImage(named: "icon_Phone"))
        self.addSubview(phoneImageView)
        phoneImageView.isUserInteractionEnabled = true
        let phoneTapGesture = UITapGestureRecognizer(target: self, action: #selector(iconDidClick(tap:)))
        phoneTapGesture.loginType = .Phone
        phoneImageView.addGestureRecognizer(phoneTapGesture)
        phoneImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(-48)
            make.top.equalTo(textLabel.snp.bottom).offset(10)
        }
        
        
        
        let qqImageView = UIImageView(image: UIImage(named: "icon_QQ"))
        self.addSubview(qqImageView)
        qqImageView.isUserInteractionEnabled = true
        let qqTapGesture = UITapGestureRecognizer(target: self, action: #selector(iconDidClick(tap:)))
        qqTapGesture.loginType = .QQ
        qqImageView.addGestureRecognizer(qqTapGesture)
        qqImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(phoneImageView.snp.centerY)
            make.left.equalTo(phoneImageView.snp.right).offset(48)
        }
    }
    
    
    // MARK: - 相应手势方法
    @objc private func iconDidClick(tap : UITapGestureRecognizer){
        guard let loginType = tap.loginType else{
            return
        }
        switch loginType {
            case .Phone:
                    print("手机")
            case .QQ:
                    print("qq")
                    let appDel = UIApplication.shared.delegate as! AppDelegate
                    let permissions = [kOPEN_PERMISSION_GET_USER_INFO, kOPEN_PERMISSION_GET_SIMPLE_USER_INFO]
                    appDel.tencentAuth.authorize(permissions)
        }
    }
}

// MARK: - UITapGestureRecognizer添加属性
private var key: Void?
extension UITapGestureRecognizer
{
    var loginType: LoginMethod?{
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &key, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
        get {
            return objc_getAssociatedObject(self, &key) as? LoginMethod
        }
    }
}
