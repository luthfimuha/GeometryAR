//
//  QuizViewController.swift
//  GeometryAR
//
//  Created by Luthfi on 26/03/21.
//

import UIKit

class QuizViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet var questionImageView: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerButtonA: UIButton!
    @IBOutlet weak var answerButtonB: UIButton!
    @IBOutlet weak var answerButtonC: UIButton!
    @IBOutlet weak var answerButtonD: UIButton!
    
    var quizManager = QuizManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        progressBar.layer.cornerRadius = 4
        progressBar.clipsToBounds = true

        updateUI()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    @IBAction func backPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        
        let isCorrectAnswer = quizManager.checkAnswer(userAnswer: userAnswer)
        
        if isCorrectAnswer{
            
        } else {
            
        }
        
        quizManager.nextQuestion()
        updateUI()
        
        
        
    }
    
    
    func updateUI() {
        
        if !quizManager.isFinished {
            
            print(quizManager.getQuestionImage())
            
            let imageString = quizManager.getQuestionImage()
            
            if imageString == "" {
                questionImageView.isHidden = true
            } else {
                questionImageView.isHidden = false
                questionImageView.image = UIImage(named: imageString)
            }

            questionLabel.text = quizManager.getQuestionText()
            
            let answerChoices = quizManager.getAnswers()
            
            answerButtonA.setTitle(answerChoices[0], for: .normal)
            answerButtonB.setTitle(answerChoices[1], for: .normal)
            answerButtonC.setTitle(answerChoices[2], for: .normal)
            answerButtonD.setTitle(answerChoices[3], for: .normal)
            
            progressBar.setProgress(quizManager.getProgress(), animated: true)
            
//            progressBar.progress = quizManager.getProgress()
        }
        
        else {
            performSegue(withIdentifier: "quizToResult", sender: self)
        }
    
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        quizManager.resetQuiz()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "quizToResult" {
            
            let vc = segue.destination as? ResultViewController
            
            let score = quizManager.getScoreResult()
            
            if score > 50 {
                vc?.isGoodResult = true
            } else {
                vc?.isGoodResult = false
            }
            
            let scoreString = String(format:"%.0f", score)
            let scoreDetail = "You got \(quizManager.score) of \(quizManager.quiz.count) questions right."
            
            vc?.score = "\(scoreString)%"
            vc?.scoreDetail = scoreDetail
            
        }
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
