//
//  ContentView.swift
//  SpaceKit
//
//  Created by Arthur Nsereko Kahwa on 5/11/23.
//

import SwiftUI
import RealityKit
import Combine

struct ContentView : View {
    let kitItems = ["habitat", "rover", "suit"]
    @State private var selectedItem: String?
    
    init() {
        selectedItem = kitItems.randomElement()
    }
    
    var body: some View {
        NavigationSplitView {
            List(kitItems, id: \.self, selection: $selectedItem) { item in
                Text(item)
            }
        } detail: {
            if let selectedItem = selectedItem {
                Text(selectedItem)
                
                ARViewContainer(kitName: selectedItem).edgesIgnoringSafeArea(.bottom)
            }
            else {
                EmptyView()
            }
        }
        .navigationTitle("Kit List")
//        .onTapGesture { location in
//            print("List: \(location)")
//        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    var kitName: String
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        context.coordinator.arView = arView
        context.coordinator.kitName = kitName
        
//        let viewCenter = arView.center // CGPointMake(arView.bounds.width / 2, arView.bounds.height / 2)
        
        let tapGestureRecogniser = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap(from:)))
        arView.addGestureRecognizer(tapGestureRecogniser)
        
        return arView
        
        
//        if let result = arView.raycast(from: viewCenter,
//                                          allowing: .estimatedPlane,
//                                          alignment: .horizontal).first {
//            let anchorEntity = AnchorEntity(raycastResult: result)
//
//            // Load the "Box" scene from the "Experience" Reality File
//            let boxAnchor = try! Experience.loadBox()
            
            // Add the box anchor to the scene
//            arView.scene.anchors.append(boxAnchor)
//
//            if let modelEntity = try? Entity.loadModel(named: "suit") {
//                anchorEntity.addChild(modelEntity)
//                arView.scene.addAnchor(anchorEntity)
//            }
//        }
//
//        return arView
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

class Coordinator: NSObject {
    weak var arView: ARView?
    var kitName: String?
    var cancellable: AnyCancellable?
    
    @objc
    func handleTap(from recogniser: UIGestureRecognizer) {
        // Make sure we have a view to work with
        guard let arView = arView
        else { return }
        
        // Clear the playing field
        arView.scene.anchors.removeAll()
        
        // Make sure we have the name of kit we want to show
        if let kitName = kitName {
            let tapLocation = arView.center
            print("view: \(tapLocation)")
            print("Kit: \(kitName)")
            
            if let raycast = arView.raycast(from: arView.center,
                                            allowing: .estimatedPlane,
                                            alignment: .horizontal).first {
                let anchor = AnchorEntity(raycastResult: raycast)
                anchor.name = kitName
                
                cancellable = ModelEntity.loadAsync(named: kitName)
                    .sink(receiveCompletion: { fetchComplete in
                        if case let .failure(error) = fetchComplete {
                            print("Error: \(String(describing: error))")
                        }
                        
                        self.cancellable?.cancel()
                        
                    }, receiveValue: { modelEntity in
                        anchor.addChild(modelEntity)
                    })
                
                arView.scene.addAnchor(anchor)
            }
        }
    }
}

