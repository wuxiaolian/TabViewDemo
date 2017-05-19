//
//  CollectionViewCell.swift
//  TabViewDemo
//
//  Created by Wuxiaolian on 2017/5/15.
//  Copyright © 2017年 Wu. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    var nameLable:UILabel?//cell上title
    var lineView:UIView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        nameLable?.highlightedTextColor = UIColor.red
        nameLable = UILabel.init()
        nameLable?.font = UIFont.systemFont(ofSize: 16)
        nameLable?.textColor = UIColor.black
        self.loadSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadSubViews(){
        contentView.addSubview(nameLable!)
        nameLable?.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }

    }
  }
