//
//  PersonalCenterViewController.swift
//  WSwiftApp
//
//  Created by LHWen on 2018/8/20.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

class PersonalCenterViewController: BaseViewController {
    
    private let roleTitleArr = ["角色", "OA账号", "部门"]
    private let userRoleArr = ["管理员", "wen", "广州分公司"]
//    private let funcIconName = ["mine_password", "mine_information", "mine_share", "mine_versions", "mine_define"]
//    private let funcTitleName = ["修改密码", "消息中心", "系统分享", "版本信息", "首页菜单管理"]
    private let funcModel: NSArray = PersonalCenterModel.personalCenterFunction()
    
    private var _tableView: UITableView?   // 定义tableView
    private let kRoleCell: String = "RoleInfoTableViewCell"
    private let kFunctionCell: String = "FunctionTableViewCell"
    private let baseColor = UIColor.init(red: 238.0/255.0, green: 234.0/255.0, blue: 247.0/255.0, alpha: 1.0)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = baseColor
        
        p_setTableViewLayout()
    }
    
    private func p_setTableViewLayout() {
        if _tableView == nil {
            
            let headerView: UIView = PersonalCenterHeaderView.init(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 233))
            
//            let tFrame: CGRect = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
            _tableView = CreateViewFactory.p_setWithTable(frame: CGRect.zero, style: .grouped)
            _tableView?.delegate = self
            _tableView?.dataSource = self
            _tableView?.tableHeaderView = headerView
            _tableView?.tableFooterView = UIView()
            _tableView?.separatorColor = ColorUtility.colorWithHexString(toConvert: "#dedede", a: 1.0)
            _tableView?.separatorInset = UIEdgeInsetsMake(0, 13.0, 0, 0)
            _tableView?.register(RoleInfoTableViewCell.classForCoder(), forCellReuseIdentifier: kRoleCell)
            _tableView?.register(FunctionTableViewCell.classForCoder(), forCellReuseIdentifier: kFunctionCell)
            view.addSubview(_tableView!)
            _tableView?.snp.makeConstraints({ (make) -> Void in
                make.edges.equalTo(self.view)
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension PersonalCenterViewController: UITableViewDelegate, UITableViewDataSource {
    
    // 分区
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // 分区多少行
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return roleTitleArr.count
        } else {
//            return funcIconName.count
            return funcModel.count
        }
    }
    
    // cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell
        
        if indexPath.section == 0 {
            tableView.separatorStyle = .none
            cell = tableView.dequeueReusableCell(withIdentifier: kRoleCell)!
            let rCell = cell as?RoleInfoTableViewCell
            rCell?.selectionStyle = UITableViewCellSelectionStyle.none
            rCell?.titleLbl?.text = roleTitleArr[indexPath.row]
            rCell?.contentLbl?.text = userRoleArr[indexPath.row]
            return rCell!
        }
        
        tableView.separatorStyle = .singleLine
        cell = tableView.dequeueReusableCell(withIdentifier: kFunctionCell)!
        let fCell = cell as?FunctionTableViewCell
        fCell?.selectionStyle = UITableViewCellSelectionStyle.default
        let model: PersonalCenterModel = funcModel[indexPath.row] as! PersonalCenterModel
        fCell?.iconImgView?.image = UIImage(named: model._iconName!)
        fCell?.titleLbl?.text = model._titleName!
//        fCell?.iconImgView?.image = UIImage(named: funcIconName[indexPath.row])
//        fCell?.titleLbl?.text = funcTitleName[indexPath.row]
        
        return fCell!
    }
    
    // 行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return 22
        }
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        if section == 0 {
            return 10.0
        }
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView: UIView = CreateViewFactory.p_setView(ColorUtility.colorWithHexString(toConvert: "#efeff4", a: 1.0), 1.0, 1.0)
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            print("----- table cell click \(indexPath.row) ----")
        
        if indexPath.section == 1 && indexPath.row == 1 {
            
            let vc = NoticeViewController()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
