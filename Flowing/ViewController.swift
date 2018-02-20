//
//  ViewController.swift
//  Flowing
//
//  Created by 高橋勇輝 on 2018/02/16.
//  Copyright © 2018年 高橋勇輝. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController,startButtonDelegate{
    
    @IBOutlet weak var ansImageView: UIImageView!
    
    var screenWidth:CGFloat = UIScreen.main.bounds.size.width
    var screenHeight:CGFloat = UIScreen.main.bounds.size.height
    var frame = CGRect(x:300,y:150,width:100,height:100)
    
    let displayLabel:UILabel = {
        let label = UILabel()
        label.text = "What usually do you do?"
        label.font = UIFont(name:"Copperplate",size:36)
        label.frame = CGRect(x:
            700,y:200,width:300,height:100)
        label.sizeToFit()
        return label
    }()
    
    let questionLabel:UILabel = {
       let label = UILabel()
        label.text = "What usually do you do?"
        label.font = UIFont(name:"Copperplate",size:36)
        label.frame = CGRect(x:
            100,y:50,width:300,height:100)
        label.sizeToFit()
        return label
    }()
    
    let easyStartButton:startButton = startButton(frame: CGRect(x:50,y:150,width:150,height:100),title: "Easy")
    
    let normalStartButton:startButton = startButton(frame: CGRect(x:270,y:150,width:150,height:100),title: "Normal")
    
    let hardStartButton:startButton = startButton(frame: CGRect(x:475,y:150,width:150,height:100),title: "Hard")
    
    let ansButton1:answerButton = answerButton(frame: CGRect(x:50,y:200,width:150,height:100),title: "A student")
    
    let ansButton2:answerButton = answerButton(frame: CGRect(x:270,y:200,width:150,height:100),title: "A teacher")
    
    let ansButton3:answerButton = answerButton(frame: CGRect(x:475,y:200,width:150,height:100),title: "A engineer")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(ansButton1)
        self.view.addSubview(ansButton2)
        self.view.addSubview(ansButton3)
        
        self.easyStartButton.delegate = self
        self.normalStartButton.delegate = self
        self.hardStartButton.delegate = self

        self.view.addSubview(easyStartButton)
        self.view.addSubview(normalStartButton)
        self.view.addSubview(hardStartButton)

        self.view.addSubview(displayLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    @objc func animateLabel(){
        easyStartButton.isHidden = true
        normalStartButton.isHidden = true
        hardStartButton.isHidden = true
        
        UIView.animate(withDuration: 0.5, animations: {() -> Void in
            self.displayLabel.frame = CGRect(x:-self.displayLabel.frame.width,y:200,width:self.displayLabel.frame.width,height:self.displayLabel.frame.height)
        }, completion: {(Bool) -> Void in
            self.view.addSubview(self.questionLabel)
            self.ansButton1.isHidden = false
            self.ansButton2.isHidden = false
            self.ansButton3.isHidden = false
        })
    }
    
}

