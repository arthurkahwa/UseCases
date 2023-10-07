//
//  Text+Extension.swift
//  AppleWatchStore
//
//  Created by Arthur Nsereko Kahwa on 10/7/23.
//

import SwiftUI

extension Text {
    func ultraLight(size: CGFloat = 20) -> Text {
        let condensed = UIFont.systemFont(ofSize: size, weight: .ultraLight, width: .condensed)
        
        return self.font(Font(condensed))
    }
    
    func heavy(size: CGFloat = 60) -> Text {
        let condensed = UIFont.systemFont(ofSize: size, weight: .heavy, width: .condensed)
        
        return self.font(Font(condensed))
    }
}
