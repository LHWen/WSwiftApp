//
//  PersonalCenterViewController.swift
//  WSwiftApp
//
//  Created by LHWen on 2018/8/20.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

class PersonalCenterViewController: BaseViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "个人中心"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
