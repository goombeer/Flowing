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

class ViewController: UIViewController {
    
    var screenWidth:CGFloat = UIScreen.main.bounds.size.width
    var screenHeight:CGFloat = UIScreen.main.bounds.size.height
    
    var displayLabel:UILabel = {
        let label = UILabel()
        label.text = "What usually do you do?"
        label.font = UIFont(name:"Copperplate",size:36)
        label.frame = CGRect(x:
            700,y:200,width:300,height:100)
        label.sizeToFit()
        return label
    }()
    
    var questionLabel:UILabel = {
       let label = UILabel()
        label.text = "What usually do you do?"
        label.font = UIFont(name:"Copperplate",size:36)
        label.frame = CGRect(x:
            100,y:50,width:300,height:100)
        label.sizeToFit()
        return label
    }()
    
    var startButton:UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 10
        button.layer.frame = CGRect(x:300,y:150,width:100,height:100)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 36)
        button.addTarget(self, action: #selector(ViewController.animateLabel), for: .touchUpInside)
        return button
    }()
    
    var answerButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.blue
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.frame = CGRect(x:0,y:0,width:100,height:100)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(startButton)
        self.view.addSubview(displayLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    @objc func animateLabel(){
        self.startButton.removeFromSuperview()
        UIView.animate(withDuration: 10.0, animations: {() -> Void in
            self.displayLabel.frame = CGRect(x:-self.displayLabel.frame.width,y:200,width:self.displayLabel.frame.width,height:self.displayLabel.frame.height)
        }, completion: {(Bool) -> Void in
            self.view.addSubview(self.questionLabel)
//            self.addAnswerLabel()
        })
    }
    
//    func addAnswerLabel(){
//        var num:Int = 0
//        repeat {
//            if num == 0 {
//                print(num)
//                self.answerButton.setTitle("A student", for: .normal)
//                self.answerButton.layer.frame = CGRect(x:100,y:150,width:100,height:100)
//                self.view.addSubview(self.answerButton)
//            }else if num == 1 {
//                print(num)
//                self.answerButton.setTitle("A programmer", for: .normal)
//                self.answerButton.layer.frame = CGRect(x:200,y:150,width:100,height:100)
//                self.view.addSubview(self.answerButton)
//            }else if num == 2 {
//                print(num)
//                self.answerButton.setTitle("A teacher", for: .normal)
//                self.answerButton.layer.frame = CGRect(x:300,y:150,width:100,height:100)
//                self.view.addSubview(self.answerButton)
//            }
//
//            num += 1
//        } while (num <= 2)
//    }
}

