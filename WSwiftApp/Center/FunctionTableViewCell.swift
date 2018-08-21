//
//  FunctionTableViewCell.swift
//  WSwiftApp
//
//  Created by LHWen on 2018/8/21.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

class FunctionTableViewCell: UITableViewCell {
    
    var iconImgView: UIImageView?
    var titleLbl: UILabel?
    var rightImgView: UIImageView?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = .white
        p_setup()
    }
    
    private func p_setup() {
        
        p_setupIconImageViewLayout()
        p_setupTitleLableLayout()
        p_setupRightImageViewLayout()
    }
    
    private func p_setupIconImageViewLayout() {
        if iconImgView == nil {
            
            iconImgView = CreateViewFactory.p_setImagVIewScaleAspectFit("mine_password")
            self.contentView.addSubview(iconImgView!)
            iconImgView?.snp.makeConstraints({ (make) -> Void in
                make.centerY.equalTo(self.contentView.snp.centerY)
                make.left.equalTo(13.0)
            })
        }
    }
    
    private func p_setupTitleLableLayout() {
        if titleLbl == nil {
            
            titleLbl = CreateViewFactory.p_setLableWhiteBGAndOneLinesLeft("修改密码", 15.0, ColorUtility.colorWithHexString(toConvert: "#333333", a: 1.0))
            self.contentView.addSubview(titleLbl!)
            titleLbl?.snp.makeConstraints({ (make) -> Void in
                make.centerY.equalTo(self.contentView.snp.centerY)
                make.left.equalTo(iconImgView!.snp.right).offset(13.0)
            })
        }
    }
    
    private func p_setupRightImageViewLayout() {
        if rightImgView == nil {
            
            rightImgView = CreateViewFactory.p_setImagVIewScaleAspectFit("My_client_r")
            self.contentView.addSubview(rightImgView!)
            rightImgView?.snp.makeConstraints({ (make) -> Void in
                make.centerY.equalTo(self.contentView.snp.centerY)
                make.right.equalTo(-13.0)
            })
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
