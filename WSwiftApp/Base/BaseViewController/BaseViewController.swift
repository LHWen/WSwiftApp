//
//  BaseViewController.swift
//  WSwiftApp
//
//  Created by LHWen on 2018/8/16.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = ColorUtility.colorWithHexString(toConvert: "efeff4", a: 1.0)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "返回", style: .plain, target: nil, action: nil)
        
//        if Float(UIDevice.current.systemVersion)! < 11.0 {
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
