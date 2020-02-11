//
//  UIImage-Extension.swift
//  TRIFLE
//
//  Created by Yang on 2020/2/10.
//  Copyright © 2020 Yang. All rights reserved.
//

import UIKit


extension UIImage
{
    ///返回原始图片
    class func originalImageWith(name imageName : String) -> UIImage?{
        let image = UIImage(named: imageName)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        return image
    }
    
    ///根据输入的rgb返回一张img
    class func renderImageWith(rgb color : UIColor) -> UIImage{
        let rect: CGRect = CGRect(x: 0, y: 0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        guard let context = UIGraphicsGetCurrentContext() else{
            UIGraphicsEndImageContext()
            return UIImage()
        }
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image ?? UIImage()
    }
}
