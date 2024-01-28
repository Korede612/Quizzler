//
//  QuizItem.swift
//  Quizzler
//
//  Created by Oko-osi Korede on 28/01/2024.
//

import Foundation


struct QuizItem {
    let question: String
    let answer: String
}

extension QuizItem {
    init(q: String, a: String) {
        question = q
        answer = a
    }
}
