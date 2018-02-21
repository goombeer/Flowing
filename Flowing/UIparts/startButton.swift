//
//  startButton.swift
//  Flowing
//
//  Created by 高橋勇輝 on 2018/02/20.
//  Copyright © 2018年 高橋勇輝. All rights reserved.
//

import UIKit


@objc protocol startButtonDelegate{
    func tapStart(sender:startButton)
}

class startButton: UIButton {
    weak var delegate: startButtonDelegate?
    
    init(frame: CGRect,title: String) {
        super.init(frame: frame)
        self.setTitle(title, for: .normal)
        self.backgroundColor = UIColor.blue
        self.titleLabel?.font = UIFont.systemFont(ofSize: 26)
        self.layer.cornerRadius = 10
        self.layer.frame = frame
        self.addTarget(self, action: #selector(self.tappedButton), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedButton(){
        self.delegate?.tapStart(sender: self)
    }
}
