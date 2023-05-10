//
//  Model.swift
//  SpaceStuff
//
//  Created by Arthur Nsereko Kahwa on 5/10/23.
//

import Foundation
import RealityKit
import Combine

struct Model {
    var arView: ARView
    var cancellable: AnyCancellable?
    
    init() {
        arView = ARView(frame: .zero)
    }
    
    mutating func makeRayCast(from tapLocation: CGPoint, with itemName: String?) {
        guard arView.scene.anchors.first(where: { $0.name == itemName }) == nil
        else {
            return
        }
        
        if let raycastingResult = arView.raycast(from: tapLocation,
                                                    allowing: .estimatedPlane,
                                                    alignment: .horizontal).first,
        let itemName = itemName {
            let anchorEntity = AnchorEntity(world: raycastingResult.worldTransform)
            
            cancellable = ModelEntity.loadAsync(named: itemName)
                .sink(receiveCompletion: { loadComplete in
                    if case let .failure(error) = loadComplete {
                        print(String(describing: error))
                    }
                }, receiveValue: { modelEntity in
                    modelEntity.name = itemName
                    anchorEntity.addChild(modelEntity)
                })
            
            arView.scene.anchors.append(anchorEntity)
        }
    }
}
