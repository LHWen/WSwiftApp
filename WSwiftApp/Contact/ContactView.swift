//
//  ContactView.swift
//  WSwiftApp
//
//  Created by LHWen on 2018/8/21.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

class ContactView: UIView {
    
    private var _codeImageView: UIImageView?
    private var _markLabel: UILabel?
    private let _codeViewSize: CGFloat = UIScreen.main.bounds.size.width / 2.0 - 10

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        p_setup()
    }
    
    private func p_setup() {
        
        p_setQRCodeImageView()
        p_setMarkLable()
    }
    
    private func p_setQRCodeImageView() {
        
        if _codeImageView == nil {
            
            let imagBGView: UIView = CreateViewFactory.p_setView(.white, 2.0, 1.0)
            self.addSubview(imagBGView)
            imagBGView.snp.makeConstraints { (make) -> Void in
                make.centerY.centerX.equalTo(self)
                make.size.equalTo(_codeViewSize)
            }
            
            _codeImageView = CreateViewFactory.p_setImagVIewScaleAspectFill("qrCode")
            _codeImageView?.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(_codeImageView!)
            _codeImageView?.snp.makeConstraints({ (make) -> Void in
                make.centerX.centerY.equalTo(self)
                make.size.equalTo(_codeViewSize - 20)
            })
        }
    }
    
    private func p_setMarkLable() {
        
        if _markLabel == nil {
            
            _markLabel = CreateViewFactory.p_setLable("技术支撑：广东xxxx技术有限公司", 14.0, .clear, .white, .center, 1, 0)
            _markLabel?.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(_markLabel!)
            _markLabel?.snp.makeConstraints({ (make) -> Void in
                make.centerX.equalTo(self)
                make.top.equalTo(_codeImageView!.snp.bottom).offset(20.0)
            })
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
