//
//  TRLoginView.swift
//  TRIFLE
//
//  Created by Yang on 2020/2/11.
//  Copyright © 2020 Yang. All rights reserved.
//

import UIKit
import SnapKit
class TRLoginView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureLoginView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureLoginView(){
        self.backgroundColor = UIColor.red
//        self.snp.top
    }
}
