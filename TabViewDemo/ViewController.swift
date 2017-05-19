//
//  ViewController.swift
//  TabViewDemo
//
//  Created by Wuxiaolian on 2017/5/11.
//  Copyright © 2017年 Wu. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController,UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource {
    let titleArray = ["推荐", "热点", "视频", "社会","娱乐", "科技","问答","汽车","财经","军事","体育"]
    var selectedIndex:NSInteger = 0
    let pageSize:Int = Int(1/0.13)

    override func viewDidLoad() {
        super.viewDidLoad()
        loadSubViews()
        //不允许自动调整布局、自动适配滚动视图
        self.automaticallyAdjustsScrollViewInsets = false;
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barTintColor = UIColor.red
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        let dic: [AnyHashable: Any] = [ NSForegroundColorAttributeName : UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = dic as? [String : Any]
        self.navigationItem.title = "测试"

    }
    // mark - UICollectionViewDelegate&&UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell
        cell?.nameLable?.text = titleArray[indexPath.item]
        if indexPath.item == selectedIndex && indexPath.section == 0 {
            cell?.isSelected = true
            self.typeView.selectItem(at: IndexPath(item: indexPath.row, section: indexPath.section), animated: true, scrollPosition: [])
          self.collectionView(self.typeView, didSelectItemAt: IndexPath(item: indexPath.row, section: indexPath.section))
            cell?.nameLable?.textColor = UIColor.red
            cell?.nameLable?.font = UIFont .systemFont(ofSize: 19)
        }
        else{
            cell?.nameLable?.textColor = UIColor.black
            cell?.nameLable?.font = UIFont .systemFont(ofSize: 17
            )

        }
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        for subView in contentView.subviews {
            if subView.frame.origin.x == scrollView.contentOffset.x {
                let view = (subView as! CircleView)
                let title = titleArray[selectedIndex]
                view.setTitleName(titleName: title)
            }
        }
        if selectedIndex == indexPath.item {
            return
        }
        selectedIndex = indexPath.item
        self.typeView.reloadData()
        let count: CGFloat = CGFloat(pageSize/2)
        let indexT: CGFloat = CGFloat(selectedIndex)

        if selectedIndex <= pageSize/2{
            self.typeView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
            
        }else{
            self.typeView.setContentOffset(CGPoint(x:0.132*KScreenWidth*(indexT - count), y: 0), animated: true)
        }

    }
    
    //mark - UIScrollViewDelegate
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index: Int = Int(scrollView.contentOffset.x / KScreenWidth)
        for subView in contentView.subviews {
            if subView.frame.origin.x == scrollView.contentOffset.x {
                let view = (subView as! CircleView)
                let title = titleArray[index]
                view.setTitleName(titleName: title)
            }
        }
        let indexT: CGFloat = scrollView.contentOffset.x / KScreenWidth
        let count: CGFloat = CGFloat(pageSize/2)

        if index <= pageSize/2{
            self.typeView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
 
        }else{
            self.typeView.setContentOffset(CGPoint(x:0.132*KScreenWidth*(indexT-count), y: 0), animated: true)
        }
        
        selectedIndex = index
        self.typeView.reloadData()
        
    }
    // mark - 视图加载、布局

    func loadSubViews(){
        self.view.addSubview(cantainerView)
        cantainerView.addSubview(typeView)
        cantainerView.addSubview(btAdd)
        btAdd.addSubview(lineView)

        cantainerView.addSubview(circleView)
        circleView.addSubview(scrollView)
        scrollView.addSubview(contentView)
        self.setupSubViews()
     }
    func setupSubViews(){
        typeView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(64)
            make.height.equalTo(0.05*KScreenHeight)
        }
        btAdd.snp.makeConstraints { (make) in
            make.trailing.top.bottom.equalTo(self.typeView)
            make.width.equalTo(0.075*KScreenWidth)
        }
        lineView.snp.makeConstraints { (make) in
            make.leading.equalTo(-0.5)
            make.top.equalTo(8)
            make.bottom.equalTo(-8)
            make.width.equalTo(0.5)
        }
        circleView.snp.makeConstraints { (make) in
            make.top.equalTo(typeView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(circleView)
        }
        contentView.snp.makeConstraints { (make) in
            make.edges.height.equalTo(scrollView)
            make.width.equalTo(Int(KScreenWidth)*titleArray.count)
        }


        for index in 0 ..< titleArray.count {
            let view = CircleView.init()
            contentView.addSubview(view)
            view.snp.makeConstraints({ (make) in
                make.top.bottom.equalTo(contentView)
                make.leading.equalTo(Int(KScreenWidth)*index)
                make.width.equalTo(KScreenWidth)
            })
            
        }
//        print(KScreenWidth)
//        print(KScreenHeight)

    }
    // mark -  Propertites懒加载
    fileprivate lazy var cantainerView: UIView = {
        let bgView = UIView.init(frame: self.view.bounds)
        return bgView
    }()
    // 顶部标签，由UICollectionView构成
    fileprivate lazy var typeView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        //列间距,行间距,偏移
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0.022*KScreenWidth
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width:0.11*KScreenWidth,height:0.04*KScreenHeight)
        layout.sectionInset = UIEdgeInsetsMake(0, 0.03*KScreenWidth, 0, 0.03*KScreenWidth)

        let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.setColorWithR(245, g: 245, b: 245, alpha: 1);
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        //注册一个cell
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier:"CollectionViewCell")

        return collectionView;
    }()
    fileprivate lazy var circleView: UIView = {
        let view = UIView.init()
        return view;
    }()
    fileprivate lazy var contentView: UIView = {
        let view = UIView.init()
        return view;
    }()
    fileprivate lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView.init()
        scrollView.isPagingEnabled =  true
        scrollView.delegate = self
        scrollView.bounces = false

        return scrollView;
    }()
    fileprivate lazy var btAdd: UIButton = {
        let button  = UIButton(type: UIButtonType.custom)
        button.backgroundColor = UIColor.setColorWithR(250, g: 250, b: 250, alpha: 1)
        button.setTitle("+", for: UIControlState.normal)
        button.setTitleColor(UIColor.black, for: UIControlState.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return button;
    }()
    fileprivate lazy var lineView: UIView = {
        let view = UIView.init()
        view .backgroundColor = UIColor.lightGray
        return view;
    }()
}

