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
    
    @IBOutlet weak var topBar: UIView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    @IBOutlet weak var pageTitle: UILabel!
    
    @IBOutlet weak var descImageView: UIImageView!
    @IBOutlet weak var saImageView: UIImageView!
    @IBOutlet weak var vImageView: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var selectedShape: String = ""
    var selectedScene: String = ""
    var materialData = MaterialManager()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //get Content
        
        pageTitle.text = selectedShape.capitalized
        
        let material = materialData.getMaterial(for: selectedShape)
        
        selectedScene = material.scene
        descImageView.image = UIImage(named: material.description, in: Bundle.main, with: nil)
        saImageView.image = UIImage(named: material.surfaceArea, in: Bundle.main, with: nil)
        vImageView.image = UIImage(named: material.volume, in: Bundle.main, with: nil)
        
        // setup 3D scene
        
        sceneView.autoenablesDefaultLighting = true
        sceneView.cameraControlConfiguration.allowsTranslation = false
        sceneView.allowsCameraControl = true
        
        // Disable Camera Panning
        
        for reco in sceneView.gestureRecognizers! {
            if let panReco = reco as? UIPanGestureRecognizer {
                panReco.maximumNumberOfTouches = 1
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.async {
            
            self.sceneView.scene = SCNScene(named:self.selectedScene)
            
            //lighting
            
            
            let lightNode = SCNNode()
            lightNode.light = SCNLight()
            lightNode.light?.type = .omni
            lightNode.position = SCNVector3(x: 10, y: 20, z: -10)
            
            lightNode.light?.intensity = 250
            self.sceneView.scene!.rootNode.addChildNode(lightNode)
            
            let intensity = lightNode.light?.intensity
            
            print("omni light added \(String(describing: intensity))")
            
            
            // 6: Creating and adding ambien light to scene
            let ambientLightNode = SCNNode()
            ambientLightNode.light = SCNLight()
            ambientLightNode.light?.type = .ambient
            ambientLightNode.position  = SCNVector3(x: 1, y: 2, z: 1)
            ambientLightNode.light?.color = UIColor.lightGray
            self.sceneView.scene!.rootNode.addChildNode(ambientLightNode)
            
            
            self.spinner.stopAnimating()
        }
    }
    
    @IBAction func backPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}


