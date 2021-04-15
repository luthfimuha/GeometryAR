//
//  HelpViewController.swift
//  GeometryAR
//
//  Created by Luthfi on 15/04/21.
//

import UIKit

class HelpViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    

    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func getMarkerButton(_ sender: Any) {
        
        guard let url = URL(string: "https://masboris.me/marker.pdf") else {return}
        UIApplication.shared.open(url)
        
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
