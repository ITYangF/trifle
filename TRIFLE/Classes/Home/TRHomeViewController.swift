//
//  TRHomeViewController.swift
//  TRIFLE
//
//  Created by Yang on 2020/2/9.
//  Copyright © 2020 Yang. All rights reserved.
//

import UIKit

class TRHomeViewController: UIViewController {
    /// 推荐控制器
    let recommendVC = TRRecommendViewController()
    /// 关注控制器
    let ettentionVC = TREttentionViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureHomeController()
    }
    
    // MARK: -配置控制器
    private func configureHomeController(){
        let segmentControl = TRSegmentedControl(items: ["推荐","关注"])
        segmentControl.frame = CGRect(x: 0, y: 0, width: 140, height: 32)
        segmentControl.selectedSegmentIndex = 0
        segmentControl.setSegmentControll(normalColor: UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1.0), selectedColor: UIColor(red: 251/255.0, green: 84/255.0, blue: 6/255.0, alpha: 1.0), dividerColor: UIColor.clear)
        
        segmentControl.addTarget(self, action: #selector(segmentControlValueChanged(segment:)), for: UIControl.Event.valueChanged)
        self.navigationItem.titleView = segmentControl
        
        addChild(recommendVC)
        addChild(ettentionVC)
        view.addSubview(recommendVC.view)
        view.addSubview(ettentionVC.view)
        recommendVC.view.isHidden = false
        ettentionVC.view.isHidden = true
        
    }
    
    // MARK: -segmentControl 监听的方法
    @objc private func segmentControlValueChanged(segment : UISegmentedControl){
        recommendVC.view.isHidden = segment.selectedSegmentIndex != 0
        ettentionVC.view.isHidden = segment.selectedSegmentIndex == 0
    }

}




