//
//  DateStyleTools.swift
//  WSwiftApp
//
//  Created by LHWen on 2018/8/31.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

class DateStyleTools: NSObject {
    
    /** yyyy-MM-dd HH:mm:ss样式 毫秒时间戳 */
    class func horizontalLineStyle(_ mSecondStr: String) -> String {
        return dateStringStyle(mSecondStr, "yyyy-MM-dd HH:mm:ss")
    }
    
    /** yyyy-MM-dd HH:mm样式 毫秒时间戳 */
    class func horizontalLineNoSecondsStayle(_ mSecondStr: String) -> String {
        return dateStringStyle(mSecondStr, "yyyy-MM-dd HH:mm")
    }
    
    /** yyyy-MM-dd样式 毫秒时间戳 */
    class func horizontalLineNoTimeStayle(_ mSecondStr: String) -> String {
        return dateStringStyle(mSecondStr, "yyyy-MM-dd")
    }
    
    /** yyyy年MM月dd日 HH:mm:ss样式 毫秒时间戳 */
    class func yearMonthDataStyle(_ mSecondStr: String) -> String {
        return dateStringStyle(mSecondStr, "yyyy年MM月dd日 HH:mm:ss")
    }
    
    /** yyyy年MM月dd日 HH:mm样式 毫秒时间戳 */
    class func yearMonthDataNoSecondeStyle(_ mSecondStr: String) -> String {
        return dateStringStyle(mSecondStr, "yyyy年MM月dd日 HH:mm")
    }
    
    /** yyyy年MM月dd日样式 毫秒时间戳 */
    class func yearMonthDataNoTimeStyle(_ mSecondStr: String) -> String {
        return dateStringStyle(mSecondStr, "yyyy年MM月dd日")
    }
    
    /** 毫秒值、秒值 返回时间样式 */
    class func dateStringStyle(_ secondStr: String, _ styleStr: String) -> String {
       
        var dateTime: NSDate
        if secondStr.count > 10 {
            dateTime = NSDate.init(timeIntervalSince1970: TimeInterval(Int64(secondStr)! / 1000))
        } else {
            dateTime = NSDate.init(timeIntervalSince1970: TimeInterval(Int64(secondStr)!))
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = styleStr
        
        return dateFormatter.string(from: dateTime as Date)
    }

}
