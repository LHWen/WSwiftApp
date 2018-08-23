//
//  CalculateTextHeight.swift
//  WSwiftApp
//
//  Created by LHWen on 2018/8/23.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

// 计算文本高度
class CalculateTextHeight: NSObject {
    
    /** 计算文本高度 */
    class func textHeight(_ text: String, _ width: CGFloat, _ fontSize: CGFloat) -> CGFloat {
        
        let pstyle: NSMutableParagraphStyle = NSMutableParagraphStyle.init()
        pstyle.lineBreakMode = .byCharWrapping
        pstyle.alignment = .left
        
        let fullRange: NSRange = NSMakeRange(0, text.count)
        let attriString: NSMutableAttributedString = NSMutableAttributedString.init(string: text)
        attriString.addAttribute(NSAttributedStringKey.paragraphStyle, value: pstyle, range: fullRange)
        attriString.addAttribute(NSAttributedStringKey.font, value: UIFont.systemFont(ofSize: fontSize), range: fullRange)
        attriString.addAttribute(NSAttributedStringKey.backgroundColor, value: UIColor.black, range: fullRange)
        
        let rect: CGRect = attriString.boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, context: nil)
        
        return rect.size.height + 15.0
    }
    
    class func spaceTextHeight(_ text: String, _ width: CGFloat, _ fontSize: CGFloat, _ spacing: CGFloat) -> CGFloat {
        
        let pstyle: NSMutableParagraphStyle = NSMutableParagraphStyle.init()
        pstyle.lineBreakMode = .byCharWrapping
        pstyle.alignment = .left
        pstyle.lineSpacing = spacing   // 行间距
        pstyle.hyphenationFactor = 0.0
        pstyle.firstLineHeadIndent = 0.0 // 首行缩进距离
        pstyle.paragraphSpacingBefore = 0.0 // 改变段落之间的距离
        pstyle.headIndent = 0.0 // 头部缩进距离
        pstyle.tailIndent = 0.0 // 大于0 将会显示竖直方向的文字
        
        let fullRange: NSRange = NSMakeRange(0, text.count)
        let attriString: NSMutableAttributedString = NSMutableAttributedString.init(string: text)
        attriString.addAttribute(NSAttributedStringKey.paragraphStyle, value: pstyle, range: fullRange)
        attriString.addAttribute(NSAttributedStringKey.font, value: UIFont.systemFont(ofSize: fontSize), range: fullRange)
        attriString.addAttribute(NSAttributedStringKey.kern, value: 1.5, range: fullRange)
        
        let rect: CGRect = attriString.boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, context: nil)
        
        return rect.size.height
    }
}
