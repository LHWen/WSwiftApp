//
//  ViewController.swift
//  WSwiftApp
//
//  Created by LHWen on 2018/8/15.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = ColorUtility.colorWithHexString(toConvert: "#1aa0ed", a: 1.0)
        
        let btn: UIButton = UIButton(type: .custom)
        btn.frame = CGRect(x: 40, y: 50, width: 100, height: 40)
        btn.setTitle("click show", for: UIControlState.normal)
        btn.setTitleColor(UIColor.white, for: UIControlState.normal)
        btn.setTitleColor(UIColor.black, for: UIControlState.highlighted)
        btn.setTitleColor(.white, for: .selected)
        btn.setBackgroundImage(ColorUtility.createImageWithColor(color: .orange), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(btn)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

