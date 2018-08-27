//
//  RefreshTableViewController.swift
//  WSwiftApp
//
//  Created by LHWen on 2018/8/27.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

class RefreshTableViewController: BaseViewController {
    
    private var _tableView: UITableView?
    private var dataArr: [String] = []
    private let kRefreshCell = "RefreshCell"
    // refresh
    private var _refreshControl = UIRefreshControl()
    var convertedDate = ""
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "table refresh"
        
        p_setRefreshDate()
        p_setData()
        
        p_setTableViewLayout()
    }
    
    private func p_setTableViewLayout() {
        
        if _tableView == nil {
            _tableView = CreateViewFactory.p_setWithTable(frame: CGRect.zero, style: .plain)
            _tableView?.delegate = self
            _tableView?.dataSource = self
            _tableView?.tableFooterView = UIView()
            _tableView?.separatorColor = ColorUtility.colorWithHexString(toConvert: "#dedede", a: 1.0)
            _tableView?.separatorInset = UIEdgeInsetsMake(0, 13.0, 0, 0)
            _tableView?.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: kRefreshCell)
            view.addSubview(_tableView!)
            _tableView?.snp.makeConstraints({ (make) -> Void in
                make.edges.equalTo(self.view)
            })
            
            _refreshControl.attributedTitle = NSAttributedString(string: "下拉刷新 上次刷新时间 \(convertedDate)")
            _refreshControl.tintColor = .orange
            _refreshControl.addTarget(self, action: #selector(p_setData), for: .valueChanged)
            _tableView?.addSubview(_refreshControl)
        }
    }
    
    @objc private func p_setData() {
        
        dataArr.removeAll()
        for i in 0 ..< 30 {
            let arc = arc4random() % UInt32(100) + UInt32(i)
            dataArr.append("随机数据 \(arc)")
        }
        
        _refreshControl.endRefreshing()
        _tableView?.reloadData()
        
        p_setRefreshDate()
    }
    
    private func p_setRefreshDate() {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        convertedDate = dateFormatter.string(from: now)
        
        _refreshControl.attributedTitle = NSAttributedString(string: "下拉刷新 上次刷新时间 \(convertedDate)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension RefreshTableViewController: UITableViewDelegate, UITableViewDataSource {
    // 分区
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // 分区多少行
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    // cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: kRefreshCell)
        cell?.selectionStyle = UITableViewCellSelectionStyle.default
        
        cell?.textLabel?.text = dataArr[indexPath.row]
        
        return cell!
    }
    
    // 行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.fade)
    }
    
}
