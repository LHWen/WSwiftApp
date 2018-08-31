//
//  StringUtils.swift
//  WSwiftApp
//
//  Created by LHWen on 2018/8/31.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

class StringUtils: NSObject {

    /** 空字符串 返回空字符串 */
    class func isEmptySpace(_ str: String) -> String {
        let judg: Bool = str.count == 0 || str.trimmingCharacters(in: CharacterSet.whitespaces).count == 0
        if judg {
            return ""
        }
        return str
    }
    
    /** 空字符串 返回横线 “--” */
    class func isEmptyLine(_ str: String) -> String {
        let judg: Bool = str.count == 0 || str.trimmingCharacters(in: CharacterSet.whitespaces).count == 0
        if judg {
            return "--"
        }
        return str
    }
    
    /** 空字符串 返回自定义字符串 noneStr */
    class func isEmptyCust(_ str: String, _ noneStr: String) -> String {
        let judg: Bool = str.count == 0 || str.trimmingCharacters(in: CharacterSet.whitespaces).count == 0
        if judg {
            return noneStr
        }
        return str
    }
}
