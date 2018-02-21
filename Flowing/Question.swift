//
//  QuestionData.swift
//  Flowing
//
//  Created by 高橋勇輝 on 2018/02/21.
//  Copyright © 2018年 高橋勇輝. All rights reserved.
//

import Foundation

class QuestionData {
    var question:String
    
    var answer1:String
    var answer2:String
    var answer3:String
    
    var correctAnswer:String
    
    var userChoiceAnswer:String?
    
    var questionNo: Int = 0
    
    init(questionSourceDataArray: [String]) {
        question = questionSourceDataArray[0]
        answer1 = questionSourceDataArray[1]
        answer2 = questionSourceDataArray[2]
        answer3 = questionSourceDataArray[3]
        correctAnswer = questionSourceDataArray[4]
        
    }
 
    func isCorrect()-> Bool{
        if correctAnswer == userChoiceAnswer {
            return true
        }
        return false
    }
    
}

class QuestionDataManager  {
    
    static let sharedInstance = QuestionDataManager()
    
    var questionDataArry = [QuestionData]()
    
    var nowQuetionIndex = 0
    private init(){
        
    }
    
    func loadQuestion(){
        questionDataArry.removeAll()
        
        guard let csvPath = Bundle.main.path(forResource: "Question", ofType: "csv")else{
            print("csvファイルが存在しません")
            return
        }
        
        do {
            let csvStringData = try String(contentsOfFile: csvPath, encoding: String.Encoding.utf8)
            csvStringData.enumerateLines{ (line,stop) in
                let questionSourceDataArray = line.components(separatedBy: ",")
                let questionData = QuestionData(questionSourceDataArray:questionSourceDataArray)
                self.questionDataArry.append(questionData)
            }
        } catch let error{
            print(error)
            return
        }
    }
    
    func goNextQuestion()-> QuestionData?{
        if nowQuetionIndex < questionDataArry.count {
            let nextQuestion = questionDataArry[nowQuetionIndex]
            nowQuetionIndex += 1
            return nextQuestion
        }
        return nil
    }
}
