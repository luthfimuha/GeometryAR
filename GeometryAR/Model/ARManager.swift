//
//  ARManager.swift
//  GeometryAR
//
//  Created by Luthfi on 13/04/21.
//

import Foundation
import ARKit

struct ARManager {
    
    let modelData: [String:ARModel] = [
    
        "cube" : ARModel(marker: "cube", scene: "art.scnassets/ar/box.scn"),
        "cuboid" : ARModel(marker: "cuboid", scene: "art.scnassets/ar/cuboid.scn"),
        "pyramid" : ARModel(marker: "square-pyramid", scene: "art.scnassets/ar/pyramid.scn"),
        "cylinder" : ARModel(marker: "cylinder", scene: "art.scnassets/ar/cylinder.scn"),
        "cone" : ARModel(marker: "cone", scene: "art.scnassets/ar/cone.scn"),
        "sphere" : ARModel(marker: "sphere", scene: "art.scnassets/ar/sphere.scn"),
        "tetrahedron" : ARModel(marker: "triangular-pyramid", scene: "art.scnassets/ar/t_pyramid.scn"),
        "tprism" : ARModel(marker: "triangular-prism", scene: "art.scnassets/ar/t_prism.scn"),
    ]
    
    
    
    
}
