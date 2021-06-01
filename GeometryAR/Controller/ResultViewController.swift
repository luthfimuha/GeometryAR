//
//  ResultViewController.swift
//  GeometryAR
//
//  Created by Luthfi on 15/04/21.
//

import UIKit

class ResultViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreDetailLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var score: String?
    var scoreDetail: String?
    var isGoodResult: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isGoodResult! {
            titleLabel.text = "🎉 Congratulations!  🎉"
            scoreLabel.textColor = UIColor.systemGreen
        } else {
            titleLabel.text = "Dont give up! 😊"
            scoreLabel.textColor = UIColor.systemPink
        }
        
        scoreLabel.text = score
        scoreDetailLabel.text = scoreDetail

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tryAgainPressed(_ sender: Any) {

        navigationController?.popViewController(animated: true)

    }
    

    @IBAction func backToHomePressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
        
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
