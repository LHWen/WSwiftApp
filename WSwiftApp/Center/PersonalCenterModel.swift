//
//  PersonalCenterModel.swift
//  WSwiftApp
//
//  Created by LHWen on 2018/8/24.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

class PersonalCenterModel: NSObject {
    
    public var _iconName: String?
    public var _titleName: String?

    init(iconName: String, titleName: String) {
        super.init()
        
        _iconName = iconName
        _titleName = titleName
    }
    
    class func personalCenterFunction() -> NSArray {

        let arr: NSArray = [
            PersonalCenterModel.init(iconName: "mine_password", titleName: "修改密码"),
            PersonalCenterModel.init(iconName: "mine_information", titleName: "消息中心"),
            PersonalCenterModel.init(iconName: "mine_share", titleName: "系统分享"),
            PersonalCenterModel.init(iconName: "mine_versions", titleName: "版本信息"),
            PersonalCenterModel.init(iconName: "mine_define", titleName: "首页菜单管理")
                            ]
        return arr as NSArray
    }

}
