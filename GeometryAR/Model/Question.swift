//
//  Question.swift
//  GeometryAR
//
//  Created by Luthfi on 15/04/21.
//

import Foundation
import UIKit

struct Question {
    
    let text: String
    
    let image: String
    
    //Multiple choice questions have multiple answers, an Array of Strings would work for our quiz data.
    let answers: [String]
    //Look at the data in the quiz array, there is a seperate string that is the correctAnswer.
    let correctAnswer: String
    
    //The initialiser needs to be updated to match the new multiple choice quiz data.
    init(q: String, a: [String], image: String, correctAnswer: String) {
        text = q
        answers = a
        self.image = image
        self.correctAnswer = correctAnswer
    }
}
