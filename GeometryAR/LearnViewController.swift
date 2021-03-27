//
//  LearnViewController.swift
//  GeometryAR
//
//  Created by Luthfi on 26/03/21.
//

import UIKit
import SceneKit

class LearnViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var sceneView: SCNView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
//    let boxScene = SCNScene(named: "art.scnassets/learn/cuboid.scn")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.autoenablesDefaultLighting = true
        sceneView.cameraControlConfiguration.allowsTranslation = false
        sceneView.allowsCameraControl = true
        
        // Disable Camera Panning

        for reco in sceneView.gestureRecognizers! {
            if let panReco = reco as? UIPanGestureRecognizer {
                panReco.maximumNumberOfTouches = 1
            }
        }
        
        DispatchQueue.main.async {
            let boxScene = SCNScene(named: "art.scnassets/learn/cuboid.scn")
            self.loadScene(shapeScene: boxScene!)
        }
        
        
//        DispatchQueue.main.async {
//            self.boxScene = SCNScene(named: "art.scnassets/learn/cuboid.scn")
//
//            self.sceneView.autoenablesDefaultLighting = true
//            self.sceneView.cameraControlConfiguration.allowsTranslation = false
//
//
//            self.sceneView.allowsCameraControl = true
//
//
//            self.sceneView.scene = self.boxScene
//
//            // Disable Camera Panning
//
//            for reco in self.sceneView.gestureRecognizers! {
//                if let panReco = reco as? UIPanGestureRecognizer {
//                    panReco.maximumNumberOfTouches = 1
//                }
//            }
//        }
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func loadScene(shapeScene: SCNScene) {
        
        sceneView.scene = shapeScene
        
    }
    
    @IBAction func backPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func gridButtonPressed(_ sender: Any) {
        
        DispatchQueue.main.async {
            self.loadScene(shapeScene: SCNScene(named: "art.scnassets/learn/box.scn")!)
        }
        
    }

}

