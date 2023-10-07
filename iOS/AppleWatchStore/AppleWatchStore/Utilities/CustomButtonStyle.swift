//
//  CustomButtonStyle.swift
//  AppleWatchStore
//
//  Created by Arthur Nsereko Kahwa on 10/5/23.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    var radius: CGFloat = 4
    var background: Color = .black
    var border: Color = .clear
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.horizontal, 5)
            .padding(.vertical, 8)
            .background(background)
            .clipShape(RoundedRectangle(cornerRadius: radius))
            .buttonStyle(.plain)
            .overlay {
                RoundedRectangle(cornerRadius: radius)
                    .stroke(border, lineWidth: 1)
            }
    }
}
