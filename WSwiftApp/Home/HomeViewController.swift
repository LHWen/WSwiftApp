//
//  HomeViewController.swift
//  WSwiftApp
//
//  Created by LHWen on 2018/8/20.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    var flowLayout: UICollectionViewFlowLayout?
    var collectionView: UICollectionView?
    let dataArr = ["item 1", "item 2", "item 3", "item 4", "item 5", "item 6", "item 7", "item 8"]
    let kCell = "CollectionCell"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        p_setHeaderView()
        p_setCollectionViewLayout()
    }
    
    private func p_setHeaderView() {
        
        let hColor: UIColor = ColorUtility.colorWithHexString(toConvert: "#1aa0ed", a: 1.0)
        let headerView: UIView = CreateViewFactory.p_setView(hColor, 1.0, 1.0)
        self.view.addSubview(headerView)
        headerView.snp.makeConstraints { (make) ->Void in
            make.left.top.right.equalTo(self.view)
            make.height.equalTo(self.view.bounds.width/2.0)
        }
    }
    
    func p_setCollectionViewLayout() {
        
        if flowLayout == nil {
            flowLayout = UICollectionViewFlowLayout()
            flowLayout?.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
            flowLayout?.minimumInteritemSpacing = 0
            flowLayout?.minimumLineSpacing = 0
            
            let collectionVRect: CGRect = CGRect(x: 0, y: self.view.bounds.width/2.0, width: self.view.bounds.width, height: self.view.bounds.height - self.view.bounds.width/2.0 - 49.0)
            collectionView = UICollectionView(frame: collectionVRect, collectionViewLayout: flowLayout!)
            collectionView?.backgroundColor = ColorUtility.colorWithHexString(toConvert: "efeff4", a: 1.0)
            collectionView?.delegate = self
            collectionView?.dataSource = self
            collectionView?.register(HomeCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: kCell)
//            collectionView?.register(UICollectionReusableView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kHeader)
//            collectionView?.register(UICollectionReusableView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: kFooter)
            view.addSubview(collectionView!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("data array count is \(String(describing: self.dataArr.count))")
        return (self.dataArr.count)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: HomeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: kCell, for: indexPath) as! HomeCollectionViewCell
        
        cell.titleLbl?.text = self.dataArr[indexPath.row]
        
        return cell
    }
    
    // 定义大小
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemSize: CGSize = CGSize(width: self.view.bounds.width/3.0, height: 89.0);
        return itemSize;
    }
    
    // 设置是否可以选择cell
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // 设置是否支持高亮
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // 选择项
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("click collection view item row is \(indexPath.row)")
    }
}
