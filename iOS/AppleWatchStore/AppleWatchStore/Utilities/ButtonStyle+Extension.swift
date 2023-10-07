//
//  ButtonStyle+Extension.swift
//  AppleWatchStore
//
//  Created by Arthur Nsereko Kahwa on 10/5/23.
//

import SwiftUI

extension ButtonStyle where Self == CustomButtonStyle {
    static var customBordered: Self {
        return .init(radius: 6, background: Color(.baseLightGrey))
    }
    
    static var borderedBlack: Self {
        return .init(radius: 6, background: Color(.baseBlack))
    }
}
