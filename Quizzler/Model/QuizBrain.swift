//
//  QuizBrain.swift
//  Quizzler
//
//  Created by Oko-osi Korede on 28/01/2024.
//

import Foundation

struct QuizBrain {
    let quiz: [QuizItem]
    var questionNumber = 0
    var score = 0
    
    init() {
        quiz = [
            QuizItem(q: "A slug's blood is green.", a: "True"),
            QuizItem(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
            QuizItem(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
            QuizItem(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
            QuizItem(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
            QuizItem(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
            QuizItem(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
            QuizItem(q: "Google was originally called 'Backrub'.", a: "True"),
            QuizItem(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
            QuizItem(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
            QuizItem(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
            QuizItem(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
        ]
    }
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if quiz[questionNumber].answer == userAnswer {
            score += 1
            return true
        } else {
            return false
        }
//        return quiz[questionNumber].answer == userAnswer
    }
    
    func getQuestion() -> String {
        return quiz[questionNumber].question
    }
    
    func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(quiz.count)
    }
    
    func canFetchNextQuestion() -> Bool {
        return questionNumber < quiz.count
    }
    
    mutating func nextQuestion() {
        questionNumber += 1
    }
    
    func getQuizScore() -> Int {
        return score
    }
}
