//
//  AppContactViewController.swift
//  WSwiftApp
//
//  Created by LHWen on 2018/8/20.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

class AppContactViewController: BaseViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.orange
        
        let bgImagView: UIImageView = CreateViewFactory.p_setImagVIewScaleAspectFill("contact_bg")
        self.view.addSubview(bgImagView)
        bgImagView.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view)
        }
        
        let scrollView: UIScrollView = UIScrollView.init(frame: self.view.bounds)
        scrollView.backgroundColor = .clear
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentSize = CGSize(width: 220.0, height: self.view.bounds.size.height + 0.5)
        self.view.addSubview(scrollView)
        
        let clearView: ContactView = ContactView.init(frame: self.view.frame)
        clearView.backgroundColor = .clear
        scrollView.addSubview(clearView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
