//
//  ShapeMenuViewController.swift
//  GeometryAR
//
//  Created by Luthfi on 27/03/21.
//

import UIKit

class LearnViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func shapePressed(_ sender: UIButton) {
        performSegue(withIdentifier: "learnToMaterial", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "learnToMaterial" {
            
            let senderButton = sender as! UIButton
            let vc = segue.destination as? MaterialViewController
            
            switch senderButton.tag {
            case 1:
                vc?.selectedShape = "cube"
            case 2:
                vc?.selectedShape = "cuboid"
            case 3:
                vc?.selectedShape = "pyramid"
            case 4:
                vc?.selectedShape = "cylinder"
            case 5:
                vc?.selectedShape = "cone"
            case 6:
                vc?.selectedShape = "sphere"
            case 7:
                vc?.selectedShape = "tetrahedron"
            case 8:
                vc?.selectedShape = "tprism"
            default:
                print("Invalid button tag")
            }
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
