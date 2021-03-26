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
    
    
    var coneNode, cubeNode, cuboidNode, pyramidNode, cylinderNode, sphereNode, tPyramidNode, tPrismNode : SCNNode?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
        sceneView.autoenablesDefaultLighting = true
    
        
       
        let cubeScene = SCNScene(named: "art.scnassets/box.scn")
        let cuboidScene = SCNScene(named: "art.scnassets/cuboid.scn")
        let pyramidScene = SCNScene(named: "art.scnassets/pyramid.scn")
        let cylinderScene = SCNScene(named: "art.scnassets/cylinder.scn")
        let coneScene = SCNScene(named: "art.scnassets/cone.scn")
        let sphereScene = SCNScene(named: "art.scnassets/sphere.scn")
        let tPyramidScene = SCNScene(named: "art.scnassets/t_pyramid.scn")
        let tPrismScene = SCNScene(named: "art.scnassets/t_prism.scn")
        
        cubeNode = cubeScene?.rootNode
        cuboidNode = cuboidScene?.rootNode
        pyramidNode = pyramidScene?.rootNode
        cylinderNode = cylinderScene?.rootNode
        coneNode = coneScene?.rootNode
        sphereNode = sphereScene?.rootNode
        tPyramidNode = tPyramidScene?.rootNode
        tPrismNode = tPrismScene?.rootNode
        
       
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
        
        
        
        // Run the view's session
        sceneView.session.run(configuration)
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
