//
//  ColorUtility.swift
//  WSwiftApp
//
//  Created by LHWen on 2018/8/15.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

class ColorUtility: NSObject {
    
    /** 十六进制颜色 */
    class func colorWithHexString(toConvert: String, a: CGFloat) -> UIColor {
        
        let DEFAULT_VOID_COLOR: UIColor = UIColor.lightGray
        var cString: String = toConvert.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased()
        
        // String should be 8 characters
        if cString.count == 8 {
            return DEFAULT_VOID_COLOR
        }
        
        // strip 0X if it appears
        if cString.hasPrefix("0X") {
            cString = String(cString.suffix(from: cString.index(cString.startIndex, offsetBy: 2)))
        }
        if cString.hasPrefix("#") {
            cString = String(cString.suffix(from: cString.index(cString.startIndex, offsetBy: 1)))
        }
        
        // Separate into r, g, b substrings
        var startIndex: String.Index
        var endIndex: String.Index
        
        if cString.count == 8 {
            startIndex = cString.index(cString.startIndex, offsetBy: 2)
        } else {
            startIndex = cString.index(cString.startIndex, offsetBy: 0)
        }
        endIndex = cString.index(startIndex, offsetBy: 2)
        let rString = cString[startIndex ..< endIndex]
        
        if cString.count == 8 {
            startIndex = cString.index(cString.startIndex, offsetBy: 4)
        } else {
            startIndex = cString.index(cString.startIndex, offsetBy: 2)
        }
        endIndex = cString.index(startIndex, offsetBy: 2)
        let gString = cString[startIndex ..< endIndex]
        
        if cString.count == 8 {
            startIndex = cString.index(cString.startIndex, offsetBy: 6)
        } else {
            startIndex = cString.index(cString.startIndex, offsetBy: 4)
        }
        endIndex = cString.index(startIndex, offsetBy: 2)
        let bString = cString[startIndex ..< endIndex]
        
        // scan values
        var r: UInt32 = 0, g: UInt32 = 0, b:UInt32 = 0
        Scanner(string: String(rString)).scanHexInt32(&r)
        Scanner(string: String(gString)).scanHexInt32(&g)
        Scanner(string: String(bString)).scanHexInt32(&b)
        
        var alpha: CGFloat = a
        if alpha > 1.0 {
            alpha = 1.0
        }
        if alpha < 0 {
            alpha = 0
        }
        
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: alpha)
    }
    
    /** r g b 颜色 */
    class func colorWithRGB(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        
        var alpha: CGFloat = a
        
        if alpha > 1.0 {
            alpha = 1.0
        }
        if alpha < 0 {
            alpha = 0
        }
        
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
    }
    
    /** 创建颜色图片 */
    class func createImageWithColor(color: UIColor) -> UIImage {
        
        let rect: CGRect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return image
    }
}
