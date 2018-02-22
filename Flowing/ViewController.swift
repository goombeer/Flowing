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
import AudioToolbox

class ViewController: UIViewController,startButtonDelegate,answerButtonDelegate{
    @IBOutlet weak var ansImageView: UIImageView!
    
    var screenWidth:CGFloat = UIScreen.main.bounds.size.width
    var screenHeight:CGFloat = UIScreen.main.bounds.size.height
    
    var questionArray: QuestionData?
    
    var speed:CGFloat = 0.0
    var score:Int = 0
    
    let displayLabel:UILabel = {
        let label = UILabel()
        label.text = "What usually do you do?"
        label.font = UIFont(name:"Copperplate",size:36)
        label.frame = CGRect(x:
            700,y:50,width:500,height:100)
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
        
        QuestionDataManager.sharedInstance.loadQuestion()
        self.questionArray = QuestionDataManager.sharedInstance.goNextQuestion()
        
        self.view.addSubview(ansButton1)
        self.view.addSubview(ansButton2)
        self.view.addSubview(ansButton3)
        
        self.easyStartButton.delegate = self
        self.normalStartButton.delegate = self
        self.hardStartButton.delegate = self
        
        self.ansButton1.setTitle(questionArray?.answer1, for: .normal)
        self.ansButton2.setTitle(questionArray?.answer2, for: .normal)
        self.ansButton3.setTitle(questionArray?.answer3, for: .normal)

        self.ansButton1.delegate = self
        self.ansButton2.delegate = self
        self.ansButton3.delegate = self

        
        self.view.addSubview(easyStartButton)
        self.view.addSubview(normalStartButton)
        self.view.addSubview(hardStartButton)
        
        self.displayLabel.text = questionArray?.question
        self.view.addSubview(displayLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    @objc func tapStart(sender:startButton){
        let selectMode:String = (sender.titleLabel?.text)!
        if selectMode == "Easy" {
            self.speed = 10
        } else if selectMode == "Normal" {
            self.speed = 5
        } else {
            self.speed = 1
        }
        
        easyStartButton.isHidden = true
        normalStartButton.isHidden = true
        hardStartButton.isHidden = true
        
        animateLabel()
    }
    
    @objc func tapAnswer(sender:answerButton){
        let selectAns = sender.titleLabel?.text
        showAnswer(answer: selectAns!)
    }
    
    func animateLabel(){
        UIView.animate(withDuration: TimeInterval(speed), animations: {() -> Void in
            self.displayLabel.frame = CGRect(x:-self.displayLabel.frame.width,y:50,width:self.displayLabel.frame.width,height:self.displayLabel.frame.height)
        }, completion: {(Bool) -> Void in
            self.ansButton1.isHidden = false
            self.ansButton2.isHidden = false
            self.ansButton3.isHidden = false
        })
    }
    
    func showAnswer(answer:String){
        questionArray?.userChoiceAnswer = answer
        if (questionArray?.isCorrect())!{
            self.score += 1
            self.ansImageView.image = UIImage(named:"correct")
            AudioServicesPlayAlertSound(1025)
            guard let nextQuestion = QuestionDataManager.sharedInstance.goNextQuestion() else{
                //nilの場合→得点表示
                self.resetDisplay()
                self.showResult()
                return
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                self.resetDisplay()
                self.setQuestion(nextQuestion: nextQuestion)
                self.animateLabel()
            }
        } else {
            self.ansImageView.image = UIImage(named:"wrong")
            AudioServicesPlayAlertSound(1006)
            guard let nextQuestion = QuestionDataManager.sharedInstance.goNextQuestion() else{
                //nilの場合→得点表示
                self.resetDisplay()
                self.showResult()
                return
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                self.resetDisplay()
                self.setQuestion(nextQuestion: nextQuestion)
                self.animateLabel()
            }
        }

    }
    
    func resetDisplay(){
        self.displayLabel.frame = CGRect(x:700,y:50,width:500,height:100)
        self.ansImageView.image = UIImage(named:"blank")
        self.ansButton1.isHidden = true
        self.ansButton2.isHidden = true
        self.ansButton3.isHidden = true
        
    }
    
    func showResult(){
        self.displayLabel.font = UIFont(name:"Copperplate",size:36)
        self.displayLabel.text = String(score) + "点"
        self.displayLabel.frame = CGRect(x:350,y:50,width:150,height:100)
    }
    
    func setQuestion(nextQuestion:QuestionData){
        self.ansButton1.setTitle(nextQuestion.answer1, for: .normal)
        self.ansButton2.setTitle(nextQuestion.answer2, for: .normal)
        self.ansButton3.setTitle(nextQuestion.answer3, for: .normal)
        
        self.displayLabel.text = nextQuestion.question
        
        self.questionArray = nextQuestion
    }
}

