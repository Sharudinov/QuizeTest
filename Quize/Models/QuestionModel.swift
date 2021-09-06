//
//  questionModel.swift
//  Quize
//
//  Created by Мурад on 30.08.2021.
//

import Foundation

struct QuestionModel {
    var title: String
    var answers: Array<String>
    var rightAnswer: String
    
    init (title: String, answers: Array<String>, rightAnswer: String){
        self.title = title
        self.answers = answers
        self.rightAnswer = rightAnswer
    }
    
    
}
struct Queezy {
    var name: String
    var questions: Array<QuestionModel>
    
    init (name: String, questions: Array<QuestionModel>){
        self.name = name
        self.questions = questions
    }
}
class SaveQueezy {
    var pollse = [
        Queezy(name: "Test", questions: [
            QuestionModel(title: "Как по английски кошка", answers: ["rat","cat","bat"], rightAnswer: "cat"),
            
        ])
    ]
}

