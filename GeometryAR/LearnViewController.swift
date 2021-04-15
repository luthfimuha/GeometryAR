//
//  LearnViewController.swift
//  GeometryAR
//
//  Created by Luthfi on 26/03/21.
//

import UIKit
import SceneKit

class MaterialViewController: UIViewController{
    
    
    
    @IBOutlet weak var sceneView: SCNView!
    
    @IBOutlet weak var testLabel: UILabel!
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    
    var text:String = "....."
    
    
//    let boxScene = SCNScene(named: "art.scnassets/learn/cuboid.scn")
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        sceneView.autoenablesDefaultLighting = true
        sceneView.cameraControlConfiguration.allowsTranslation = false
        sceneView.allowsCameraControl = true
        
        testLabel?.text = text
        
        // Disable Camera Panning

        for reco in sceneView.gestureRecognizers! {
            if let panReco = reco as? UIPanGestureRecognizer {
                panReco.maximumNumberOfTouches = 1
            }
        }
        
        DispatchQueue.main.async {
            let boxScene = SCNScene(named: "art.scnassets/learn/t_pyramid.scn")
            self.loadScene(shapeScene: boxScene!)
        }
            

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func loadScene(shapeScene: SCNScene) {
        
        sceneView.scene = shapeScene
        
    }
    
    @IBAction func backPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func testButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "toShapeMenu", sender: self)
        
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toShapeMenu" {
            let vc = segue.destination as! ShapeMenuViewController
            vc.delegate = self
            vc.selectedString = "zZzZz"
        }
    }
    
    func updatedSelectedName(newName: String) {
        // do something with newName
        loadScene(shapeScene: SCNScene(named: "art.scnassets/learn/cylinder.scn")!)
        
    }
    


}


