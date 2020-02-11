//
//  TRTabBarController.swift
//  TRIFLE
//
//  Created by Yang on 2020/2/9.
//  Copyright © 2020 Yang. All rights reserved.
//

import UIKit

class TRTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTabBarController()
        self.tabBar.tintColor = UIColor.red
        
    }
    // MARK: -给图标添加点击动画
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        for subview in self.tabBar.subviews{
            if subview.isKind(of: NSClassFromString("UITabBarButton")!) {
                let tabarBtn = subview as! UIControl
                tabarBtn.addTarget(self, action: #selector(tabbarImageviewAddAnimation(tabbarBtn:)), for: .touchUpInside)
            }
        }
    }
    
    // MARK: -配置控制器
    private func configureTabBarController(){
        let homeVC = TRHomeViewController()
        let videoVC = TRVideoViewController()
        let publishVC = TRPublishViewController()
        let communicateVC = TRCommunicateViewController()
        let profileVC = TRProfileViewController()
        
        let homeNav = UINavigationController(rootViewController: homeVC)
        homeNav.tabBarItem.title = "首页"
        homeNav.tabBarItem.image = UIImage.originalImageWith(name: "home")
        homeNav.tabBarItem.selectedImage = UIImage(named: "home_selected")
        
        let videoNav = UINavigationController(rootViewController: videoVC)
        videoNav.tabBarItem.title = "视频"
        videoNav.tabBarItem.image = UIImage.originalImageWith(name: "video")
        videoNav.tabBarItem.selectedImage = UIImage(named: "video_selected")
        
        let publishNav = UINavigationController(rootViewController: publishVC)
        publishNav.tabBarItem.title = "发布"
        publishNav.tabBarItem.image = UIImage.originalImageWith(name: "publish")
        publishNav.tabBarItem.selectedImage = UIImage(named: "publish_selected")
        
        let communicateNav = UINavigationController(rootViewController: communicateVC)
        communicateNav.tabBarItem.title = "消息"
        communicateNav.tabBarItem.image = UIImage.originalImageWith(name: "communication")
        communicateNav.tabBarItem.selectedImage = UIImage(named: "communication_selected")
        
        let profileNav = UINavigationController(rootViewController: profileVC)
        profileNav.tabBarItem.title = "我的"
        profileNav.tabBarItem.image = UIImage.originalImageWith(name: "profile")
        profileNav.tabBarItem.selectedImage = UIImage(named: "profile_selected")
        
        self.viewControllers = [homeNav,videoNav,publishNav,communicateNav,profileNav]

    }
    
    // MARK: -图标监听的方法
    @objc private func tabbarImageviewAddAnimation(tabbarBtn : UIControl){
        for imageView in tabbarBtn.subviews{
            if imageView.isKind(of: NSClassFromString("UITabBarSwappableImageView")!) {
                let animation:  CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
                animation.values = [0.0, -4.15, -7.26, -9.34, -10.37, -9.34, -7.26, -4.15, 0.0, 2.0, -2.9, -4.94, -6.11, -6.42, -5.86, -4.44, -2.16, 0.0]
                animation.duration = 0.8
                animation.calculationMode = .cubic
                imageView.layer.add(animation, forKey: nil)
            }
        }
        
    }
}
