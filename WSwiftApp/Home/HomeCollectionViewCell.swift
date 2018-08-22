//
//  HomeCollectionViewCell.swift
//  WSwiftApp
//
//  Created by LHWen on 2018/8/22.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    private var containerView: UIView?
    var iconView: UIImageView?
    var titleLbl: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        p_setup()
    }
    
    private func p_setup() {
        
        p_setContainerView()
        p_setIconAndTitleLayout()
        p_setupleftAndBottomLineView()
        
        if self.isHighlighted {
            iconView?.alpha = 0.7
        } else {
            iconView?.alpha = 1.0
        }
    }
    
    private func p_setContainerView() {
        
        if containerView == nil {
            containerView = CreateViewFactory.p_setView(.white, 1.0, 1.0)
            self.contentView.addSubview(containerView!)
            containerView?.snp.makeConstraints({ (make) -> Void in
                make.edges.equalTo(self.contentView)
            })
        }
    }
    
    private func p_setIconAndTitleLayout() {
        
        if iconView == nil {
            iconView = CreateViewFactory.p_setImagVIewScaleAspectFit("homepage_menu_icon_orderQuery")
            containerView?.addSubview(iconView!)
            iconView?.snp.makeConstraints({ (make) -> Void in
                make.centerX.equalTo(containerView!.snp.centerX)
                make.top.equalTo(20.0)
            })
            
            titleLbl = CreateViewFactory.p_setLableWhiteBGAndOneLines("item", 12.0, ColorUtility.colorWithHexString(toConvert: "#333333", a: 1.0), .center)
            containerView?.addSubview(titleLbl!)
            titleLbl?.snp.makeConstraints({ (make) -> Void in
                make.centerX.equalTo(containerView!.snp.centerX)
                make.bottom.equalTo(-15.0)
            })
        }
    }
    
    private func p_setupleftAndBottomLineView() {
        
        let lineColor: UIColor = ColorUtility.colorWithHexString(toConvert: "#e5e5e5", a: 1.0)
        let rightLine = CreateViewFactory.p_setView(lineColor, 1.0, 1.0)
        let bottomLine = CreateViewFactory.p_setView(lineColor, 1.0, 1.0)
        
        containerView?.addSubview(rightLine)
        containerView?.addSubview(bottomLine)
        
        rightLine.snp.makeConstraints { (make) -> Void in
            make.top.right.equalTo(containerView!)
            make.bottom.equalTo(containerView!.snp.bottom).offset(-0.5)
            make.width.equalTo(0.5)
        }
        
        bottomLine.snp.makeConstraints { (make) -> Void in
            make.left.bottom.right.equalTo(containerView!)
            make.height.equalTo(0.5)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
