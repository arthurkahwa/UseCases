//
//  Container.swift
//  SpaceStuff
//
//  Created by Arthur Nsereko Kahwa on 5/10/23.
//

import Foundation
import ARKit
import RealityKit
import Combine
import SwiftUI

struct Container: UIViewRepresentable {
    var viewModel: ViewModel
    
    func makeUIView(context: Context) -> some UIView {
        return viewModel.arView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}
