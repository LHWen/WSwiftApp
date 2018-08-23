//
//  UserDefaultsTool.swift
//  WSwiftApp
//
//  Created by LHWen on 2018/8/23.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

class UserDefaultsTool: NSObject {

    /** 存储string */
    class func setStringForKey(value: String, _ key: String) {
        let userDefault = UserDefaults.standard
        userDefault.setValue(value, forKey: key)
        userDefault.synchronize()
    }
    
    /** 存储int */
    class func setIntForKey(value: NSInteger, _ key: String) {
        let userDefault = UserDefaults.standard
        userDefault.set(value, forKey: key)
        userDefault.synchronize()
    }
    
    /** 存储float */
    class func setFloatForKey(value: CGFloat, _ key: String) {
        let userDefault = UserDefaults.standard
        userDefault.set(value, forKey: key)
        userDefault.synchronize()
    }
    
    /** 存储bool */
    class func setBoolForKey(value: Bool, _ key: String) {
        let userDefault = UserDefaults.standard
        userDefault.set(value, forKey: key)
        userDefault.synchronize()
    }
    
    /** 存储array */
    class func setArrayForKey(values: NSArray, _ key: String) {
        let userDefault = UserDefaults.standard
        userDefault.set(values, forKey: key)
        userDefault.synchronize()
    }
    
    /** 存储data */
    class func setDataForKey(value: NSData, _ key: String) {
        let userDefault = UserDefaults.standard
        userDefault.set(value, forKey: key)
        userDefault.synchronize()
    }
    
    /** 存储dictionary */
    class func setDictForKey(value: NSDictionary, _ key: String) {
        let userDefault = UserDefaults.standard
        userDefault.set(value, forKey: key)
        userDefault.synchronize()
    }
    
    /** 获取string */
    class func getStringForKey(_ key: String) -> String {
        
        var value: String = ""
        if UserDefaults.standard.string(forKey: key) != nil {
            value = UserDefaults.standard.string(forKey: key)!
        }
        return value
    }
    
    /** 获取int */
    class func getIntegerForKey(_ key: String) -> NSInteger {
        
        var value: NSInteger = UserDefaults.standard.integer(forKey: key)
        if value <= 0 {
            value = 0
        }
        return value
    }
    
    /** 获取float */
    class func getFloatForKey(_ key: String) -> CGFloat {
        
        var value: CGFloat = CGFloat(UserDefaults.standard.float(forKey: key))
        if value <= 0 {
            value = 0.0
        }
        return value
    }
    
    /** 获取bool */
    class func getBoolForKey(_ key: String) -> Bool {
        
        let value: Bool = UserDefaults.standard.bool(forKey: key)
        return value
    }
    
    /** 获取array 需要处理空数组情况 */
    class func getArrayForKey(_ key: String) -> NSArray {
        
        var values: NSArray = []
        if UserDefaults.standard.array(forKey: key) != nil {
         values = UserDefaults.standard.array(forKey: key)! as NSArray
        }
        return values
    }
    
    /** 获取data 需要处理nil情况 */
    class func getDataForKey(_ key: String) -> NSData {
       
        let value: NSData = UserDefaults.standard.data(forKey: key)! as NSData
        return value
    }
    
    /** 获取dictionary 需要处理nil情况 */
    class func getDictForKey(_ key: String) -> NSDictionary {
        
        let value: NSDictionary = UserDefaults.standard.dictionary(forKey: key)! as NSDictionary
        return value
    }
    
    /** 清除本地数据 */
    class func clearObjectForKeys(keys: NSArray) {
        
        let standardUserDefaults = UserDefaults.standard
        for key in keys {
            standardUserDefaults.removeObject(forKey: (key as! String ))
        }
        standardUserDefaults.synchronize()
    }
}
