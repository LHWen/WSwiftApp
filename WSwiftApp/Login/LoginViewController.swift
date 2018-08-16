//
//  LoginViewController.swift
//  WSwiftApp
//
//  Created by LHWen on 2018/8/16.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit
//import SnapKit

class LoginViewController: BaseViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let loginView = LoginView.init(frame: self.view.bounds)
        view.addSubview(loginView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
