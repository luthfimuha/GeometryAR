//
//  MaterialData.swift
//  GeometryAR
//
//  Created by Luthfi on 13/04/21.
//

import Foundation
import UIKit

struct MaterialManager {
    
    let material: [String:Material] = [
        "cube" : Material(desc: "cube-desc", sa: "cube-sa", v: "cube-v", s: "art.scnassets/learn/box.scn"),
        "cuboid" : Material(desc: "cuboid-desc", sa: "cuboid-sa", v: "cuboid-v", s: "art.scnassets/learn/cuboid.scn"),
        "pyramid" : Material(desc: "pyramid-desc", sa: "pyramid-sa", v: "pyramid-v", s: "art.scnassets/learn/pyramid.scn"),
        "cylinder" : Material(desc: "cylinder-desc", sa: "cylinder-sa", v: "cylinder-v", s: "art.scnassets/learn/cylinder.scn"),
        "cone" : Material(desc: "cone-desc", sa: "cone-sa", v: "cone-v", s: "art.scnassets/learn/cone.scn"),
        "sphere" : Material(desc: "sphere-desc", sa: "sphere-sa", v: "sphere-v", s: "art.scnassets/learn/sphere.scn"),
        "tetrahedron" : Material(desc: "tetrahedron-desc", sa: "tetrahedron-sa", v: "tetrahedron-v", s: "art.scnassets/learn/t_pyramid.scn"),
        "tprism" : Material(desc: "tprism-desc", sa: "tprism-sa", v: "tprism-v", s: "art.scnassets/learn/t_prism.scn"),
    ]

    func getMaterial(for shape: String) -> Material {
        return material[shape]!
    }

//    
//    case cube = "art.scnassets/learn/box.scn"
//    case cuboid = "art.scnassets/learn/cuboid.scn"
//    case cone = "art.scnassets/learn/cone.scn"
//    case cylinder = "art.scnassets/learn/cylinder.scn"
//    case sphere = "art.scnassets/learn/sphere.scn"
//    case pyramid = "art.scnassets/learn/pyramid.scn"
//    case tPyramid = "art.scnassets/learn/t_pyramid.scn"
//    case tPrism = "art.scnassets/learn/t_prism.scn"
    
}
