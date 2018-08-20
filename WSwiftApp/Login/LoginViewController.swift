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
    
    var loginView: LoginView?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        NotificationCenter.default.addObserver(self, selector: #selector(openKeyboard(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(closeKeyboard(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginView = LoginView.init(frame: self.view.bounds)
        loginView?.loginCompletion = { (userName: String, passWord: String) -> Void in
            print("userName is \(userName), passWord is \(passWord).")
            
            let nav1 = UINavigationController.init(rootViewController: HomeViewController())
            nav1.tabBarItem = self.barItem(title: "首页", image: UIImage(named: "tabbar_icon_mainpage_defult")!, sImage: UIImage(named: "tabbar_icon_mainpage_selected")!)
            
            let nav2 = UINavigationController.init(rootViewController: AppContactViewController())
            nav2.tabBarItem = self.barItem(title: "联系", image: UIImage(named: "tabbar_icon_connect_defult")!, sImage: UIImage(named: "tabbar_icon_connect_selected")!)
            
            let nav3 = UINavigationController.init(rootViewController: PersonalCenterViewController())
            nav3.tabBarItem = self.barItem(title: "个人中心", image: UIImage(named: "tabbar_icon_mycenter_defult")!, sImage: UIImage(named: "tabbar_icon_mycenter_selected")!)
            
            
            let tabBarVC = UITabBarController()
            // 是否去掉分割线色设置
//            tabBarVC.tabBar.shadowImage = ColorUtility.createImageWithColor(color: .white)
            tabBarVC.viewControllers = [nav1, nav2, nav3]
            // 切换跟视图
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.changeRootViewController(withVC: tabBarVC)
        }
        view.addSubview(loginView!)
        
    }
    
    func barItem(title: String, image: UIImage, sImage: UIImage) -> UITabBarItem {
        
        let nImage: UIImage = image.withRenderingMode(.alwaysOriginal)
        let seImage = sImage.withRenderingMode(.alwaysOriginal)
        let tabBarItem: UITabBarItem = UITabBarItem.init(title: title, image: nImage, selectedImage: seImage)
        // 修改标签栏选中时文字颜色
        tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: ColorUtility.colorWithHexString(toConvert: "#1aa0ed", a: 1.0)], for: .selected)
        // 修改标签栏未选中时文字颜色
        tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: ColorUtility.colorWithHexString(toConvert: "#999999", a: 1.0)], for: .normal)
        
        return tabBarItem
    }
    
    @objc func openKeyboard(notification: NSNotification) {
        
        let option: NSInteger = (notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).intValue
        let duration: CGFloat = CGFloat((notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).floatValue)
//        let keyBoardBounds = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        UIView.animate(withDuration: TimeInterval(duration), delay: 0, options: UIViewAnimationOptions(rawValue: UIViewAnimationOptions.RawValue(option)), animations: {
            
            var logFrame: CGRect = self.loginView!.frame
            logFrame.origin.y = -fabs(221 - (UIScreen.main.bounds.height - 483))
            self.loginView!.frame = logFrame
        }, completion: nil)
    }
    
    @objc func closeKeyboard(notification: NSNotification) {
        
        let option: NSInteger = (notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).intValue
        let duration: CGFloat = CGFloat((notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).floatValue)
        
        UIView.animate(withDuration: TimeInterval(duration), delay: 0, options: UIViewAnimationOptions(rawValue: UIViewAnimationOptions.RawValue(option)), animations: {
            
            var logFrame: CGRect = self.loginView!.frame
            logFrame.origin.y = 0
            self.loginView!.frame = logFrame
        }, completion: nil)
    }
    
    //取消键盘监听
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
