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
}
