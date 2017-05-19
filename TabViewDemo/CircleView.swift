//
//  CircleView.swift
//  TabViewDemo
//
//  Created by Wuxiaolian on 2017/5/12.
//  Copyright © 2017年 Wu. All rights reserved.
//

import UIKit

class CircleView: UIView {
    var lable : UILabel?
    var contentView : UIView?

    var title: NSString = ""

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView = UIView.init()
        contentView?.backgroundColor = UIColor.yellow
        lable = UILabel.init()
        lable?.font = UIFont.systemFont(ofSize: 20)
        lable?.textColor = UIColor.red
        self.addSubview(contentView!)
        self.addSubview(lable!)
        contentView?.snp.makeConstraints({ (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(100)
        })
        lable?.snp.makeConstraints({ (make) in
            make.center.equalToSuperview()
        })
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setTitleName(titleName: String) {
        if title as String == titleName {
            return
        }
        title = titleName as NSString
        lable?.text = titleName
    }

}
