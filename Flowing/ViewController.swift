//
//  ViewController.swift
//  Flowing
//
//  Created by 高橋勇輝 on 2018/02/16.
//  Copyright © 2018年 高橋勇輝. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var startButton: UIButton!
    
    var displayLabel:UILabel = {
         let label = UILabel()
        label.text = "What usually do you do? I'm a high school student."
        label.font = UIFont(name:"Copperplate",size:36)
        label.frame = CGRect(x:
            700,y:200,width:300,height:100)
        label.sizeToFit()
        return label
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(displayLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func tapStart(_ sender: Any) {
        self.startButton.isHidden = true
        animateLabel()
    }
    
    func animateLabel(){
        UIView.animate(withDuration: 10.0, animations: {() -> Void in
            self.displayLabel.frame = CGRect(x:-self.displayLabel.frame.width,y:200,width:self.displayLabel.frame.width,height:self.displayLabel.frame.height)
        }, completion: {(Bool) -> Void in
            print("終了")
        })
    }
}

