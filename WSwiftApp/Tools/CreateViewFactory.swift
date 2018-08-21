//
//  CreateViewFactory.swift
//  WSwiftApp
//
//  Created by LHWen on 2018/8/16.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

class CreateViewFactory: NSObject {
    
    /** lable 基本设置 text fontSize bgColor textColor textAlignment lines radius */
    class func p_setLable(_ text: String, _ fSize: CGFloat, _ bgColor: UIColor, _ tColor: UIColor, _ textAlignment: NSTextAlignment, _ lines: NSInteger, _ radius: CGFloat) -> UILabel {
        
        let lable: UILabel = UILabel.init()
        lable.text = text
        lable.font = UIFont.systemFont(ofSize: fSize)
        lable.backgroundColor = bgColor
        lable.textColor = tColor
        lable.textAlignment = textAlignment
        lable.numberOfLines = lines
        if radius > 0 {
            lable.layer.cornerRadius = radius
            lable.layer.masksToBounds = true
        }
        
        return lable
    }
    
    /** 白色底色 numberOfLines = 0 */
    class func p_setLableWhiteBGAndZeroLines(_ text: String, _ fSize: CGFloat, _ tColor: UIColor, _ textAlignment: NSTextAlignment) -> UILabel {
        
        let lable: UILabel = p_setLable(text, fSize, .white, tColor, textAlignment, 0, 0)
        
        return lable
    }
    
    /** 白色底色 numberOfLines = 1 */
    class func p_setLableWhiteBGAndOneLines(_ text: String, _ fSize: CGFloat, _ tColor: UIColor, _ textAlignment: NSTextAlignment) -> UILabel {
        
        let lable: UILabel = p_setLable(text, fSize, .white, tColor, textAlignment, 1, 0)
        
        return lable
    }
    
    /** 白色底色 left numberOfLines = 1 */
    class func p_setLableWhiteBGAndOneLinesLeft(_ text: String, _ fSize: CGFloat, _ tColor: UIColor) -> UILabel {
        
        let lable: UILabel = p_setLable(text, fSize, .white, tColor, .left, 1, 0)
        
        return lable
    }
    
    /** set UIView bacjgroundColor radius alpha */
    class func p_setView(_ bgColor: UIColor, _ radius: CGFloat, _ alpha: CGFloat) -> UIView {
        
        let view: UIView = UIView.init()
        view.backgroundColor = bgColor
        
        if alpha < 0 {
            view.alpha = 0
        } else if alpha > 1 {
            view.alpha = 1.0
        } else {
            view.alpha = alpha
        }
        
        if radius > 0 {
            view.layer.cornerRadius = radius
            view.layer.masksToBounds = true
        }
        
        return view
    }
    
    /** imageView set imageName mode isClips radius */
    class func p_setImageView(imageName: String, mode: UIViewContentMode, isClips: Bool, radius: CGFloat) -> UIImageView {
        
        let imageView: UIImageView = UIImageView.init(image: UIImage.init(named: imageName))
        imageView.contentMode = mode
        imageView.clipsToBounds = isClips
        if radius > 0 {
            imageView.layer.cornerRadius = radius
            imageView.layer.masksToBounds = true
        }
        
        return imageView
    }
    
    /** imageView set contentMode 填充满不裁剪 */
    class func p_setImagVIewScaleToFill(_ imageName: String) -> UIImageView {
        
        let imageView: UIImageView = UIImageView.init(image: UIImage.init(named: imageName))
        imageView.contentMode = .scaleToFill
        
        return imageView
    }
    
    /** imageView set contentMode 自适应图片高度 */
    class func p_setImagVIewScaleAspectFit(_ imageName: String) -> UIImageView {
        
        let imageView: UIImageView = UIImageView.init(image: UIImage.init(named: imageName))
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }
    
    /** imageView set contentMode 填充满裁剪 */
    class func p_setImagVIewScaleAspectFill(_ imageName: String) -> UIImageView {
        
        let imageView: UIImageView = UIImageView.init(image: UIImage.init(named: imageName))
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }
    
    /** set tableView */
    class func p_setWithTable(frame: CGRect, style: UITableViewStyle) -> UITableView {
        
        let tableView: UITableView = UITableView(frame: frame, style: style)
        tableView.backgroundColor = ColorUtility.colorWithHexString(toConvert: "efeff4", a: 1.0)
        tableView.estimatedRowHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        tableView.estimatedSectionHeaderHeight = 0
        
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
            
            if UIScreen.main.bounds.size.height == 812.0 { // iPhone X
                tableView.contentInset = UIEdgeInsetsMake(0, 0, 34.0, 0)
            }
        }
        
        return tableView
    }
}
