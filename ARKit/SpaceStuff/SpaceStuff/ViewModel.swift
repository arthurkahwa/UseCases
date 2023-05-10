//
//  ViewModel.swift
//  SpaceStuff
//
//  Created by Arthur Nsereko Kahwa on 5/10/23.
//

import Foundation
import RealityKit

class ViewModel: ObservableObject {
    @Published var model: Model = Model()
    
    var arView: ARView {
        model.arView
    }
    
    func makeRayCast(from location: CGPoint, with itemName: String) {
        model.makeRayCast(from: location, with: itemName)
    }
}
