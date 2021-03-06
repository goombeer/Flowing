//
//  answerButton.swift
//  Flowing
//
//  Created by 高橋勇輝 on 2018/02/19.
//  Copyright © 2018年 高橋勇輝. All rights reserved.
//

import UIKit


@objc protocol answerButtonDelegate{
    func tapAnswer(sender:answerButton)
}

class answerButton: UIButton {
    weak var delegate: answerButtonDelegate?
    
    let correctImage = UIImage(named: "correct")
    let wrongImage = UIImage(named: "wrong")
    
    init(frame: CGRect,title: String) {
        super.init(frame: frame)
        self.setTitle(title, for: .normal)
        self.backgroundColor = UIColor.blue
        self.titleLabel?.font = UIFont.systemFont(ofSize: 26)
        self.layer.cornerRadius = 10
        self.layer.frame = frame
        self.addTarget(self, action: #selector(self.tap), for: .touchUpInside)
        self.isHidden = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tap(){
        self.delegate?.tapAnswer(sender:self)
    }
    
}
