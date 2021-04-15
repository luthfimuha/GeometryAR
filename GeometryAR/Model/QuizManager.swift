//
//  QuizManager.swift
//  GeometryAR
//
//  Created by Luthfi on 15/04/21.
//

import Foundation

struct QuizManager {
    
    var questionNumber = 0
    var score = 0
    var isFinished = false
    
    let quiz = [
        Question(
            q: "What is the surface area of the cuboid?",
            a: ["344 m2", "144 m2", "250 m2", "426 m2"],
            image: "1",
            correctAnswer: "344 m2"
        ),
        Question(
            q: "A cube has lengths of 9 cm. What is the volume of the cube?",
            a: ["249 cm2", "729 cm2" ,"265 cm2","827 cm2"],
            image: "2",
            correctAnswer: "729 cm2"
        ),
        Question(
            q: "The diagram shows a cone of height 8 units and base radius 6 units. \nWhat is its volume?",
            a: ["36π", "96π", "56π", "104π"],
            image: "3",
            correctAnswer: "96π"
            ),
        Question(
            q: "The diagram shows a cone of height 24 cm and base diameter 14 cm. What is the total surface area? Use (22/7) as an approximation for π",
            a: ["629 cm2", "904 cm2", "704 cm2", "844 cm2",],
            image: "4",
            correctAnswer: "704 cm2"
        ),
        Question(
            q: "The diagram shows a cylindrical water tank of diameter 4.2 m and height 2.5 m, how many liters of water does the tank hold when full? ( 1 m3 = 1000 liter)",
            a: ["45,500 liters", "34,650 liters", "74,350 liters", "44,500 liters"],
            image: "5",
            correctAnswer: "34,650 liters"
        ),
        Question(
            q: "The diagram shows an igloo with half sphere shape of radius 2 m. What is the surface area of the igloo?",
            a: ["12π m2", "8π m2", "16π m2", "6π m2"],
            image: "6",
            correctAnswer: "8π m2"
        ),
        Question(
            q: "What is the volume of a sphere of radius 6 cm?",
            a: ["265 cm3", "168 cm3", "320 cm3", "288 cm3"],
            image: "7",
            correctAnswer: "288 cm3"
        ),
        Question(
            q: "A square pyramid has height 4 cm and slant length 5 cm. What is its total surface area?",
            a: ["126 cm2", "96 cm2", "56 cm2", "106 cm2"],
            image: "8",
            correctAnswer: "96 cm2"
        ),
        Question(
            q: "The diagram shows a prism whose cross-section is a right triangle. What is the volume of the prism?",
            a: ["54 in3", "34 in3", "64 in3", "74 in3"],
            image: "9",
            correctAnswer: "54 in3"
        ),
        Question(
            q: "The length of one edge of a regular tetrahedron is 9 units. What is its volume?",
            a: ["85.91", "64.12", "21.96", "69.42"],
            image: "10",
            correctAnswer: "85.91"
        ),
            
        
    ]
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    func getQuestionImage() -> String {
        return quiz[questionNumber].image
    }
    
    //Need a way of fetching the answer choices.
    func getAnswers() -> [String] {
        return quiz[questionNumber].answers
    }
    
    func getProgress() -> Float {
        return Float(questionNumber) / Float(quiz.count)
    }
    
    func getScoreResult() -> Float {
        return Float(score) / Float(quiz.count) * 100
    }
    
    mutating func resetQuiz() {
        questionNumber = 0
        score = 0
        isFinished = false
    }
    
    mutating func getScore() -> Int {
        return score
    }
    
     mutating func nextQuestion() {
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
//            questionNumber = 0
            isFinished = true
        }
    }
    
    mutating func checkAnswer(userAnswer: String) -> Bool {
        //Need to change answer to rightAnswer here.
        if userAnswer == quiz[questionNumber].correctAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
}
