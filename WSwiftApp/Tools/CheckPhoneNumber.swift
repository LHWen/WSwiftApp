//
//  CheckPhoneNumber.swift
//  WSwiftApp
//
//  Created by LHWen on 2018/8/16.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

class CheckPhoneNumber: NSObject {

    class func judgePhoneNumber(_ mobile: String) -> Bool {
        
        let phoneNBR: String = mobile
        if phoneNBR.count != 11 {
            return false
        } else {
            /** 移动号段正则表达式 */
            let CM_NUM = "^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$"
            /** 联通号段正则表达式 */
            let CU_NUM = "^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$"
            /** 电信号段正则表达式 */
            let CT_NUM = "^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$"
            /**
             * 大陆地区固话及小灵通
             * 区号：010,020,021,022,023,024,025,027,028,029
             * 号码：七位或八位
             */
            let PHS = "^(0[0-9]{2})\\d{8}$|^(0[0-9]{3}(\\d{7,8}))$"
            
            let pred1 = NSPredicate(format: "SELF MATCHES \(CM_NUM)")
            let pred2 = NSPredicate(format: "SELF MATCHES \(CU_NUM)")
            let pred3 = NSPredicate(format: "SELF MATCHES \(CT_NUM)")
            let pred4 = NSPredicate(format: "SELF MATCHES \(PHS)")
            
            let isMatch1 = pred1.evaluate(with: phoneNBR)
            let isMatch2 = pred2.evaluate(with: phoneNBR)
            let isMatch3 = pred3.evaluate(with: phoneNBR)
            let isMatch4 = pred4.evaluate(with: phoneNBR)
            
            if isMatch1 || isMatch2 || isMatch3 || isMatch4 {
                return true
            } else {
                return false
            }
        }
    }
}
