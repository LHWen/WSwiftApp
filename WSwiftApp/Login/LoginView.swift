//
//  LoginView.swift
//  WSwiftApp
//
//  Created by LHWen on 2018/8/16.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit
import SnapKit

class LoginView: UIView {
    
    let kUserViewHeight: CGFloat  = 52.0  // 用户名和用户密码View高度
    let kLineDistance: CGFloat    = 15.0  // 线条距离 左侧和右侧
    let kUserBtnDistace: CGFloat  = 25.0  // 用户和密码以及是否显示密码图标 左右两侧距离
    let kLoginBtnDistace: CGFloat = 30.0  // 登录按钮左右两侧距离
    let kLonginBtnHeiht: CGFloat  = 44.0  // 登录按钮高度
    let kUserPSWTSize: CGFloat    = 15.0  // 登录账号密码字体大小
    let kLoginBtnFSize: CGFloat   = 16.0  // 登录按钮字体大小
    let kLoginBtnTop: CGFloat     = 35.0  // 登录按钮顶部间距
    let kImageViewSize: CGFloat   = 30.0  // 用户名、密码以及是否显示密码button Size
    
    var headerView: UIView?
    // 用户名
    var userNameView: UIView?
    var userNameImgView: UIImageView?
    var userNameTextF: UITextField?
    // 密码设置
    var passWordView: UIView?
    var passWordImgView: UIImageView?
    var passWordTextF: UITextField?
    // 密码可视按钮
    var eyesBtn: UIButton?
    // 登录按钮
    var loginBtn: UIButton?
    
    // 闭包回调
    typealias loginButtonCompletion = (_ userName: String, _ passWord: String) -> Void
    var loginCompletion: loginButtonCompletion?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        p_setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func p_setup() {
        self.backgroundColor = ColorUtility.colorWithHexString(toConvert: "#ffffff", a: 1.0)
        
        p_setHeaderView()
        p_setupUserNameView()
        p_setupPassWordView()
    }
    
    // 初始化头部视图
    func p_setHeaderView() {
        
        if headerView == nil {
            headerView = CreateViewFactory.p_setView(ColorUtility.colorWithHexString(toConvert: "#1aa0ed", a: 1.0), 0, 1.0)
            self.addSubview(headerView!)
            headerView!.snp.makeConstraints { (make) -> Void in
                make.left.top.right.equalTo(self)
                make.height.equalTo(210.0)
            }
        }
    }
    
    func p_setupUserNameView() {
        
        if userNameView == nil {
            userNameView = CreateViewFactory.p_setView(.white, 0, 1.0)
            self.addSubview(userNameView!)
            userNameView!.snp.makeConstraints { (make) -> Void in
                make.left.right.equalTo(self)
                make.top.equalTo(headerView!.snp.bottom).offset(kUserViewHeight)
                make.height.equalTo(kUserViewHeight)
            }
            
            let bLineView: UIView = CreateViewFactory.p_setView(ColorUtility.colorWithHexString(toConvert: "#dadada", a: 1.0), 0, 1.0)
            userNameView?.addSubview(bLineView)
            bLineView.snp.makeConstraints { (make) -> Void in
                make.left.equalTo(kLineDistance)
                make.right.equalTo(-kLineDistance)
                make.bottom.equalTo(userNameView!.snp.bottom)
                make.height.equalTo(0.5)
            }
            
            p_setupUserHeaderImageViewAndTextFiled()
        }
    }
    
    func p_setupUserHeaderImageViewAndTextFiled() {
        
        if userNameImgView == nil {
            
            userNameImgView = CreateViewFactory.p_setImagVIewScaleAspectFit("user_icon")
            userNameView?.addSubview(userNameImgView!)
            userNameImgView?.snp.makeConstraints({ (make) -> Void in
                make.size.equalTo(kImageViewSize)
                make.left.equalTo(userNameView!.snp.left).offset(kUserBtnDistace)
                make.centerY.equalTo(userNameView!.snp.centerY)
            })
            
            userNameTextF = UITextField.init()
            userNameTextF?.delegate = self
            userNameTextF?.isSecureTextEntry = false
            userNameTextF?.backgroundColor = .white
            userNameTextF?.attributedPlaceholder = NSAttributedString.init(string: "请输入用户名", attributes: [NSAttributedStringKey.foregroundColor: ColorUtility.colorWithHexString(toConvert: "#cccccc", a: 1.0)])
            userNameTextF?.font = UIFont.systemFont(ofSize: kUserPSWTSize)
            userNameTextF?.textColor = ColorUtility.colorWithHexString(toConvert: "#333333", a: 1.0)
            userNameTextF?.clearButtonMode = UITextFieldViewMode.whileEditing
            userNameTextF?.returnKeyType = UIReturnKeyType.done
            userNameView?.addSubview(userNameTextF!)
            userNameTextF?.snp.makeConstraints({ (make) -> Void in
                make.left.equalTo(userNameImgView!.snp.right).offset(kLineDistance)
                make.right.equalTo(userNameView!.snp.right).offset(-kUserBtnDistace)
                make.top.bottom.equalTo(userNameImgView!)
            })
        }
    }
    
    func p_setupPassWordView() {
        
        if passWordView == nil {
            
            passWordView = CreateViewFactory.p_setView(.white, 0, 1.0)
            self.addSubview(passWordView!)
            passWordView!.snp.makeConstraints { (make) -> Void in
                make.left.right.equalTo(self)
                make.top.equalTo(userNameView!.snp.bottom)
                make.height.equalTo(kUserViewHeight)
            }
            
            let bLineView: UIView = CreateViewFactory.p_setView(ColorUtility.colorWithHexString(toConvert: "#dadada", a: 1.0), 0, 1.0)
            passWordView?.addSubview(bLineView)
            bLineView.snp.makeConstraints { (make) -> Void in
                make.left.equalTo(kLineDistance)
                make.right.equalTo(-kLineDistance)
                make.bottom.equalTo(passWordView!.snp.bottom)
                make.height.equalTo(0.5)
            }
            
            p_setupPassWordViewAndTextFiled()
            p_setupEyesButton()
            p_setupLoginButton()
        }
    }
    
    func p_setupPassWordViewAndTextFiled() {
        
        if passWordImgView == nil {
            
            passWordImgView = CreateViewFactory.p_setImagVIewScaleAspectFit("password_icon")
            passWordView?.addSubview(passWordImgView!)
            passWordImgView?.snp.makeConstraints({ (make) -> Void in
                make.size.equalTo(kImageViewSize)
                make.left.equalTo(passWordView!.snp.left).offset(kUserBtnDistace)
                make.centerY.equalTo(passWordView!.snp.centerY)
            })
            
            passWordTextF = UITextField.init()
            passWordTextF?.delegate = self
            passWordTextF?.isSecureTextEntry = true
            passWordTextF?.backgroundColor = .white
            passWordTextF?.attributedPlaceholder = NSAttributedString.init(string: "请输入密码", attributes: [NSAttributedStringKey.foregroundColor: ColorUtility.colorWithHexString(toConvert: "#cccccc", a: 1.0)])
            passWordTextF?.font = UIFont.systemFont(ofSize: kUserPSWTSize)
            passWordTextF?.textColor = ColorUtility.colorWithHexString(toConvert: "#333333", a: 1.0)
            passWordTextF?.clearButtonMode = UITextFieldViewMode.whileEditing
            passWordTextF?.returnKeyType = UIReturnKeyType.done
            passWordView?.addSubview(passWordTextF!)
            passWordTextF?.snp.makeConstraints({ (make) -> Void in
                make.left.equalTo(passWordImgView!.snp.right).offset(kLineDistance)
                make.right.equalTo(passWordView!.snp.right).offset(-60.0)
                make.top.bottom.equalTo(passWordImgView!)
            })
        }
    }
    
    func p_setupEyesButton() {
        
        if eyesBtn == nil {
            
            eyesBtn = UIButton.init(type: .custom)
            eyesBtn?.setBackgroundImage(UIImage.init(named: "view_OFF_icon"), for: .normal)
            eyesBtn?.setBackgroundImage(UIImage.init(named: "view_ON_icon"), for: .selected)
            eyesBtn?.addTarget(self, action: #selector(showPasswordTextFiled(sender:)), for: .touchUpInside)
            passWordView?.addSubview(eyesBtn!)
            eyesBtn?.snp.makeConstraints({ (make) -> Void in
                make.size.equalTo(kImageViewSize)
                make.right.equalTo(passWordView!.snp.right).offset(-kUserBtnDistace)
                make.centerY.equalTo(passWordView!.snp.centerY)
            })
        }
    }
    
    func p_setupLoginButton() {
        
        if loginBtn == nil {
            
            loginBtn = UIButton.init(type: .custom)
            loginBtn?.setBackgroundImage(ColorUtility.createImageWithColor(color: ColorUtility.colorWithHexString(toConvert: "#1aa0ed", a: 1.0)), for: .normal)
            loginBtn?.setTitle("登录", for: .normal)
            loginBtn?.setTitleColor(.white, for: .normal)
            loginBtn?.titleLabel?.font = UIFont.systemFont(ofSize: kLoginBtnFSize)
            loginBtn?.layer.cornerRadius = 4.0
            loginBtn?.layer.masksToBounds = true
            loginBtn?.addTarget(self, action: #selector(loginButtonClick(_:)), for: .touchUpInside)
            self.addSubview(loginBtn!)
            loginBtn?.snp.makeConstraints({ (make) -> Void in
                make.top.equalTo(passWordView!.snp.bottom).offset(kLoginBtnTop)
                make.left.equalTo(kLoginBtnDistace)
                make.right.equalTo(-kLoginBtnDistace)
                make.height.equalTo(kLonginBtnHeiht)
            })
        }
    }
    
    @objc func showPasswordTextFiled(sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            passWordTextF?.isSecureTextEntry = false
        } else {
            passWordTextF?.isSecureTextEntry = true
        }
    }
    
    @objc func loginButtonClick(_ sender: UIButton) {
        
        userNameTextF?.resignFirstResponder()
        passWordTextF?.resignFirstResponder()
        
        if loginCompletion != nil {
            loginCompletion?((userNameTextF?.text)!, (passWordTextF?.text)!)
        }
    }
    
}

extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
}
