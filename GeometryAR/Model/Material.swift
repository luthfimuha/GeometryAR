//
//  Material.swift
//  GeometryAR
//
//  Created by Luthfi on 13/04/21.
//

import UIKit
import Foundation

struct Material {
    
    let description: String
    let surfaceArea: String
    let volume: String
    let scene: String
    
    init(desc: String, sa: String, v: String, s: String) {
        description = desc
        surfaceArea = sa
        volume = v
        scene = s
    }
    
//    let description: UIImage
//    let surfaceArea: UIImage
//    let volume: UIImage
//
//    init(desc: String, sa: String, v: String) {
//        description = UIImage(named: desc, in: Bundle.main, with: nil)!
//        surfaceArea = UIImage(named:sa, in: Bundle.main, with: nil)!
//        volume = UIImage(named:v, in: Bundle.main, with: nil )!
//    }
    
}
