//
//  ViewController.swift
//  Quizzler
//
//  Created by Oko-osi Korede on 28/01/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = quizBrain.getQuestion()
        scoreLabel.text = "Score: \(quizBrain.getQuizScore())"
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        guard let userAnswer = sender.currentTitle else { return }
        let isCorrectAnswer = quizBrain.checkAnswer(userAnswer)
        if isCorrectAnswer {
            sender.backgroundColor = .systemGreen
        } else {
            sender.backgroundColor = .systemRed
        }
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        quizBrain.nextQuestion()
        scoreLabel.text = "Score: \(quizBrain.getQuizScore())"
        let canFetchNextQuestion = quizBrain.canFetchNextQuestion()
        if canFetchNextQuestion {
            let question = quizBrain.getQuestion()
            questionLabel.text = question
            trueButton.backgroundColor = .clear
            falseButton.backgroundColor = .clear
            updateProgressBar()
        } else {
            scoreLabel.text = "Score: \(quizBrain.getQuizScore()) / \(quizBrain.quiz.count)"
            falseButton.isEnabled = false
            trueButton.isEnabled = false
        }
    }
    
    func updateProgressBar() {
        progressBar.progress = quizBrain.getProgress()
    }
}

