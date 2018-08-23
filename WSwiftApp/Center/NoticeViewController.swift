//
//  NoticeViewController.swift
//  WSwiftApp
//
//  Created by LHWen on 2018/8/23.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

// 公告
class NoticeViewController: BaseViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "公告"
        
        let testT: String = "彼岸花开开彼岸，忘川河畔尔忘川。奈何桥头空奈何，三生石上写三生。三途忘川断生死，彼岸花开又轮回。"
        
        p_setTestLable(text: testT)
        p_setSpacingTestLable(text: testT)
    }
    
    private func p_setTestLable(text: String) {
        
        let textHeigh: CGFloat = CalculateTextHeight.textHeight(text, self.view.bounds.size.width - 26.0, 16.0)
        
        let label: UILabel = CreateViewFactory.p_setLable(text, 16.0, .green, .black, .left, 0, 0)
        self.view.addSubview(label)
        label.snp.makeConstraints { (make) -> Void in
            make.top.left.equalTo(13.0)
            make.right.right.equalTo(-13.0)
            make.height.equalTo(textHeigh)
        }
    }
    
    private func p_setSpacingTestLable(text: String) {
        
        let textHeigh: CGFloat = CalculateTextHeight.textHeight(text, self.view.bounds.size.width - 26.0, 16.0)
        let textH: CGFloat = CalculateTextHeight.spaceTextHeight(text, self.view.bounds.size.width - 26.0, 16.0, 8.0)
        
        let tLable: UILabel = CreateViewFactory.p_setLable(text, 16.0, .orange, .black, .left, 0, 0)
        
        let pstyle: NSMutableParagraphStyle = NSMutableParagraphStyle.init()
        pstyle.lineSpacing = 8.0
        
        let fullRange: NSRange = NSMakeRange(0, text.count)
        let attriString: NSMutableAttributedString = NSMutableAttributedString.init(string: text)
        attriString.addAttribute(NSAttributedStringKey.paragraphStyle, value: pstyle, range: fullRange)
        
        tLable.attributedText = attriString
        self.view.addSubview(tLable)
        tLable.snp.makeConstraints { (make) in
            make.top.equalTo(textHeigh + 26.0)
            make.left.equalTo(13.0)
            make.right.right.equalTo(-13.0)
            make.height.equalTo(textH + 10)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
