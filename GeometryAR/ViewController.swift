//
//  ViewController.swift
//  GeometryAR
//
//  Created by Luthfi on 18/03/21.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var loadingLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var coneNode, cubeNode, cuboidNode, pyramidNode, cylinderNode, sphereNode, tPyramidNode, tPrismNode : SCNNode?
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        spinner.hidesWhenStopped = true
        backButton.isHidden = true
        spinner.startAnimating()
        
        DispatchQueue.main.async {
            self.sceneView.delegate = self
            self.sceneView.autoenablesDefaultLighting = true
            
            self.loadScene()
            
            self.spinner.stopAnimating()
            self.backButton.isHidden = false
            self.loadingLabel.isHidden = true
        }
        
    }
    
    func loadScene() {
        
        
        self.cubeNode = SCNScene(named: "art.scnassets/box.scn")?.rootNode
        self.cuboidNode = SCNScene(named: "art.scnassets/cuboid.scn")?.rootNode
        self.pyramidNode = SCNScene(named: "art.scnassets/pyramid.scn")?.rootNode
        self.cylinderNode = SCNScene(named: "art.scnassets/cylinder.scn")?.rootNode
        self.coneNode = SCNScene(named: "art.scnassets/cone.scn")?.rootNode
        self.sphereNode = SCNScene(named: "art.scnassets/sphere.scn")?.rootNode
        self.tPyramidNode = SCNScene(named: "art.scnassets/t_pyramid.scn")?.rootNode
        self.tPrismNode = SCNScene(named: "art.scnassets/t_prism.scn")?.rootNode
        
        //        let cubeScene = SCNScene(named: "art.scnassets/box.scn")
        //        let cuboidScene = SCNScene(named: "art.scnassets/cuboid.scn")
        //        let pyramidScene = SCNScene(named: "art.scnassets/pyramid.scn")
        //        let cylinderScene = SCNScene(named: "art.scnassets/cylinder.scn")
        //        let coneScene = SCNScene(named: "art.scnassets/cone.scn")
        //        let sphereScene = SCNScene(named: "art.scnassets/sphere.scn")
        //        let tPyramidScene = SCNScene(named: "art.scnassets/t_pyramid.scn")
        //        let tPrismScene = SCNScene(named: "art.scnassets/t_prism.scn")
        //
        //        self.cubeNode = cubeScene?.rootNode
        //        self.cuboidNode = cuboidScene?.rootNode
        //        self.pyramidNode = pyramidScene?.rootNode
        //        self.cylinderNode = cylinderScene?.rootNode
        //        self.coneNode = coneScene?.rootNode
        //        self.sphereNode = sphereScene?.rootNode
        //        self.tPyramidNode = tPyramidScene?.rootNode
        //        self.tPrismNode = tPrismScene?.rootNode
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARImageTrackingConfiguration()
        
        
        // Get markerImages
        
        if let trackingImages = ARReferenceImage.referenceImages(inGroupNamed: "markers", bundle: Bundle.main) {
            configuration.trackingImages = trackingImages
            configuration.maximumNumberOfTrackedImages = 4
        }
        
        
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    @IBAction func backPressed(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
        //        dismiss(animated: true, completion: nil)
        
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        
        let node = SCNNode()
        
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
            case CardType.cube.rawValue:
                shapeNode = cubeNode
            case CardType.cuboid.rawValue:
                shapeNode = cuboidNode
            case CardType.cone.rawValue:
                shapeNode = coneNode
            case CardType.cylinder.rawValue:
                shapeNode = cylinderNode
            case CardType.square_pyramid.rawValue:
                shapeNode = pyramidNode
            case CardType.sphere.rawValue:
                shapeNode = sphereNode
            case CardType.tPyramid.rawValue:
                shapeNode = tPyramidNode
            case CardType.tPrism.rawValue:
                shapeNode = tPrismNode
            default:
                break
            }
            
            let shapeSpin = SCNAction.rotateBy(x: 0, y: 2 * .pi, z: 0, duration: 10)
            let repeatSpin = SCNAction.repeatForever(shapeSpin)
            shapeNode?.runAction(repeatSpin)
            
            guard let shape = shapeNode else {return nil}
            node.addChildNode(shape)
            //
            
        }
        
        return node
        
    }
    
    enum CardType : String {
        
        case cube = "cube"
        case cuboid = "cuboid"
        case cone = "cone"
        case cylinder = "cylinder"
        case sphere = "sphere"
        case square_pyramid = "square-pyramid"
        case tPyramid = "triangular-pyramid"
        case tPrism = "triangular-prism"
        
    }
    
    
    // MARK: - ARSCNViewDelegate
    
    
    
    
    
}
