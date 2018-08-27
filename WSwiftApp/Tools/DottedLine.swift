//
//  DottedLine.swift
//  WSwiftApp
//
//  Created by LHWen on 2018/8/22.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

// 虚线绘制
class DottedLine: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    public var lineColor: UIColor?
    
    override func draw(_ rect: CGRect) {
        
        let lColor: UIColor = lineColor == nil ? UIColor.gray : lineColor!
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.beginPath()
        context.setLineWidth(0.5)
        context.setStrokeColor(lColor.cgColor)
        let length = [CGFloat(2), CGFloat(2)]
        context.setLineDash(phase: 0, lengths: length)
        context.move(to: CGPoint(x: 0, y: 0))
        context.addLine(to: CGPoint(x: rect.size.width, y: 0))
        context.strokePath()
    }
    
}
