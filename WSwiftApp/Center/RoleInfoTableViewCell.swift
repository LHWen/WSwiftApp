//
//  RoleInfoTableViewCell.swift
//  WSwiftApp
//
//  Created by LHWen on 2018/8/21.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

// 角色信息

class RoleInfoTableViewCell: UITableViewCell {
    
    public var titleLbl: UILabel?
    public var contentLbl: UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = .white
        p_setup()
    }
    
    private func p_setup() {
        
        p_setTitleLable()
        p_setContentLable()
    }
    
    private func p_setTitleLable() {
        if titleLbl == nil {
            
            titleLbl = CreateViewFactory.p_setLableWhiteBGAndOneLines("role", 15.0, ColorUtility.colorWithHexString(toConvert: "#999999", a: 1.0), .left)
            self.contentView.addSubview(titleLbl!)
            titleLbl?.snp.makeConstraints({ (make) -> Void in
                make.left.equalTo(13.0)
                make.top.equalTo(self.contentView)
            })
        }
    }
    
    private func p_setContentLable() {
        if contentLbl == nil {
            
            contentLbl = CreateViewFactory.p_setLableWhiteBGAndOneLines("content", 15.0, ColorUtility.colorWithHexString(toConvert: "#333333", a: 1.0), .left)
            self.contentView.addSubview(contentLbl!)
            contentLbl?.snp.makeConstraints({ (make) -> Void in
                make.left.equalTo(130.0)
                make.top.equalTo(self.contentView)
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
