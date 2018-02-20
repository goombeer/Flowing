//
//  answerButton.swift
//  Flowing
//
//  Created by 高橋勇輝 on 2018/02/19.
//  Copyright © 2018年 高橋勇輝. All rights reserved.
//

import UIKit

class answerButton: UIButton {
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
    
    @objc func tap(sender: UIButton){
        let answer = sender.titleLabel?.text
        if answer == "A student" {
            print("生徒")
        } else if answer == "A teacher" {
            print("先生")
        } else {
            print("エンジニア")
        }
    }
    
}
