//
//  PersonalCenterHeaderView.swift
//  WSwiftApp
//
//  Created by LHWen on 2018/8/21.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

// 头部视图

class PersonalCenterHeaderView: UIView {

    public var iconImageView: UIImageView?
    public var nameLabl: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        p_setLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func p_setLayout() {
        
        p_setHeaderIconImageViewLayout()
        p_setUserNameLableLayout()
    }
    
    private func p_setHeaderIconImageViewLayout() {
        if iconImageView == nil {
            
            let buleView: UIView = CreateViewFactory.p_setView(ColorUtility.colorWithHexString(toConvert: "#1aa0ed", a: 1.0), 1.0, 1.0)
            self.addSubview(buleView)
            buleView.snp.makeConstraints { (make) -> Void in
                make.left.top.right.equalTo(self)
                make.height.equalTo(153.0)
            }
            
            iconImageView = CreateViewFactory.p_setImagVIewScaleAspectFit("role_customer")
            self.addSubview(iconImageView!)
            iconImageView?.snp.makeConstraints({ (make) -> Void in
                make.centerX.equalTo(self)
                make.top.equalTo(80.0)
            })
        }
    }
    
    private func p_setUserNameLableLayout() {
        if nameLabl == nil {
            
            nameLabl = CreateViewFactory.p_setLableWhiteBGAndOneLines("Wen", 18.0, ColorUtility.colorWithHexString(toConvert: "#333333", a: 1.0), .center)
            self.addSubview(nameLabl!)
            nameLabl?.snp.makeConstraints({ (make) -> Void in
                make.centerX.equalTo(self)
                make.top.equalTo(iconImageView!.snp.bottom).offset(10.0)
            })
        }
    }
}
