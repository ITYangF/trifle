//
//  UISegmentedControl-Extension.swift
//  TRIFLE
//
//  Created by Yang on 2020/2/11.
//  Copyright © 2020 Yang. All rights reserved.
//

import UIKit

class TRSegmentedControl : UISegmentedControl
{
    /// ios13 之后设置圆角需要继承并重写
    open override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 16
    }
}

extension UISegmentedControl
{
    /// segmentedControl样式配置
    ///
    /// 设置segmentedControl各个状态的选中颜色，字体颜色
    ///
    /// - Parameter normalColor: 普通状态下背景色
    /// - Parameter selectedColor: 选中状态下背景色
    /// - Parameter dividerColor: 选项之间的分割线颜色
    /// - Returns: 无返回值
    ///
    /// - Note:传入三个UIColor
    func setSegmentControll(normalColor : UIColor,selectedColor : UIColor,dividerColor : UIColor){
        let normalColorImage = UIImage.renderImageWith(rgb: normalColor)
        let selectedColorImage = UIImage.renderImageWith(rgb: selectedColor)
        let dividerColorImage = UIImage.renderImageWith(rgb: dividerColor)
        
        setBackgroundImage(normalColorImage, for: UIControl.State.normal, barMetrics: .default)
        setBackgroundImage(selectedColorImage, for: UIControl.State.selected, barMetrics: .default)
        setDividerImage(dividerColorImage, forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        
        setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], for: .normal)
        setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white,NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], for: .selected)
        
        self.layer.borderWidth = 0.7
        self.layer.borderColor = dividerColor.cgColor
        self.layer.cornerRadius = 16
        self.layer.masksToBounds = true

    }
}

