//
//  ARViewController.swift
//  GeometryAR
//
//  Created by Luthfi on 18/03/21.
//

import UIKit
import SceneKit
import ARKit

class ARViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var loadingLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var coneNode, cubeNode, cuboidNode, pyramidNode, cylinderNode, sphereNode, tPyramidNode, tPrismNode : SCNNode?
    
    var arManager = ARManager()
    
    var modelData: [String : ARModel] = [:]
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        modelData = arManager.modelData
        
        backButton.isHidden = true
        
        self.sceneView.delegate = self
        self.sceneView.autoenablesDefaultLighting = true
        
        
        DispatchQueue.main.async {
            
            self.loadScene()
            self.spinner.stopAnimating()
            self.backButton.isHidden = false
            self.loadingLabel.isHidden = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARImageTrackingConfiguration()
        
        // Get markerImages
        
        if let trackingImages = ARReferenceImage.referenceImages(inGroupNamed: "markers", bundle: Bundle.main) {
            configuration.trackingImages = trackingImages
            configuration.maximumNumberOfTrackedImages = 8
        }
        print("will appear")
        // Run the view's session
        //        sceneView.allowsCameraControl = true
        sceneView.session.run(configuration)
    }
    
    @IBAction func backPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        DispatchQueue.main.async {
            let lightNode = SCNNode()
            lightNode.light = SCNLight()
            lightNode.light?.type = .omni
            lightNode.position = SCNVector3(x: 0.5, y: 0.3, z: -0.1)
            lightNode.light?.intensity = 1.7
            self.sceneView.scene.rootNode.addChildNode(lightNode)
            
            let intensity = lightNode.light?.intensity
            
            print("omni light added \(String(describing: intensity))")
            
            let ambientLightNode = SCNNode()
            ambientLightNode.light = SCNLight()
            ambientLightNode.light?.type = .ambient
            ambientLightNode.position  = SCNVector3(x: 0, y: 1, z: 0)
            ambientLightNode.light?.color = UIColor.white
            ambientLightNode.light?.intensity = 180
            self.sceneView.scene.rootNode.addChildNode(ambientLightNode)
            print("ambient light added \(String(describing: ambientLightNode.light?.intensity))")
        }
        
        
        print("did appear")
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        
        let node = SCNNode()
        
        print("rendering..")
        
        if let imageAnchor = anchor as? ARImageAnchor {
            
            
            let size = imageAnchor.referenceImage.physicalSize
            let plane = SCNPlane(width: size.width, height: size.height)
            plane.firstMaterial?.diffuse.contents = UIColor.white.withAlphaComponent(0.5)
            plane.cornerRadius = 0.005
            
            let planeNode = SCNNode(geometry: plane)
            planeNode.eulerAngles.x = -.pi / 2
            node.addChildNode(planeNode)
            
            print(imageAnchor.referenceImage.name ?? "unknown")
            
            var shapeNode: SCNNode?
            
            switch imageAnchor.referenceImage.name {
            case modelData["cube"]!.marker:
                shapeNode = cubeNode
            case modelData["cuboid"]!.marker:
                shapeNode = cuboidNode
            case modelData["cone"]!.marker:
                shapeNode = coneNode
            case modelData["cylinder"]!.marker:
                shapeNode = cylinderNode
            case modelData["pyramid"]!.marker:
                shapeNode = pyramidNode
            case modelData["sphere"]!.marker:
                shapeNode = sphereNode
            case modelData["tetrahedron"]!.marker:
                shapeNode = tPyramidNode
            case modelData["tprism"]!.marker:
                shapeNode = tPrismNode
            default:
                break
            }
            
            //animating
            
            let shapeSpin = SCNAction.rotateBy(x: 0, y: 2 * .pi, z: 0, duration: 10)
            let repeatSpin = SCNAction.repeatForever(shapeSpin)
            shapeNode?.runAction(repeatSpin)
            
            guard let shape = shapeNode else {return nil}
            node.addChildNode(shape)
        }
        return node
    }
    
    func loadScene() {
        self.cubeNode = SCNScene(named: modelData["cube"]!.scene)?.rootNode
        self.cuboidNode = SCNScene(named: modelData["cuboid"]!.scene)?.rootNode
        self.pyramidNode = SCNScene(named: modelData["pyramid"]!.scene)?.rootNode
        self.cylinderNode = SCNScene(named: modelData["cylinder"]!.scene)?.rootNode
        self.coneNode = SCNScene(named: modelData["cone"]!.scene)?.rootNode
        self.sphereNode = SCNScene(named: modelData["sphere"]!.scene)?.rootNode
        self.tPyramidNode = SCNScene(named: modelData["tetrahedron"]!.scene)?.rootNode
        self.tPrismNode = SCNScene(named: modelData["tprism"]!.scene)?.rootNode
    }
}
