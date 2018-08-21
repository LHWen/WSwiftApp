//
//  AppDelegate.swift
//  WSwiftApp
//
//  Created by LHWen on 2018/8/15.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        navigationBarSet()
        
        let vc = LoginViewController()
        let nvc = UINavigationController(rootViewController: vc)
        self.window?.rootViewController = nvc
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    /** 导航栏样式设置 */
    func navigationBarSet() {
        
        // 修改导航栏背景颜色
        // 状态栏字体颜色
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        // 修改导航栏背景颜色
//        UINavigationBar.appearance().barTintColor = UIColor.init(red: 0, green: 191/255.0, blue: 1.0, alpha: 0.9)
        UINavigationBar.appearance().barTintColor = ColorUtility.colorWithHexString(toConvert: "#1aa0ed", a: 1.0)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        // 修改导航栏按钮颜色
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().isTranslucent = false
    }
    
    /** 重新登录 */
    func relogin() {
        
        DispatchQueue.main.async {
            let loginVC: LoginViewController = LoginViewController()
            let nVC: UINavigationController = UINavigationController.init(rootViewController: loginVC)
            self.window!.rootViewController = nVC
            self.window!.makeKeyAndVisible()
            }
    }
    
    /** window 切换根目录 */
    func changeRootViewController(withVC: UIViewController) {
        DispatchQueue.main.async {
            self.window!.rootViewController = withVC
        }
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

