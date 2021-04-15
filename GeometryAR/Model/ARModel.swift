//
//  ARModel.swift
//  GeometryAR
//
//  Created by Luthfi on 13/04/21.
//

import Foundation
import ARKit

struct ARModel {
    
    let marker: String
    let scene: String
    
    init(marker: String, scene: String) {
        self.marker = marker
        self.scene = scene
    }
    
}
