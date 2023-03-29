//
//  Fortune.swift
//  FortuneSDK
//
//  Created by Arthur Nsereko Kahwa on 3/29/23.
//

import Foundation

typealias FortuneTexts = [String: [String]]

public class SDK {
    public init() {}
    
    public lazy var fortune: String = {
        do {
            let path = "https://raw.githubusercontent.com/arthurkahwa/use-cases/0f5853767d6cf7caa15b03fa4feae6f7783c785c/FortuneSDK/FortuneTexts.json"
            if let url = URL(string: path) {
                let data = try Data(contentsOf: url)
                
                let fortunes = try JSONDecoder().decode(FortuneTexts.self, from: data)
                
                if let category = fortunes.randomElement(),
                   let fortune = category.value.randomElement() {
                    return fortune
                }
            }
        }
        catch {
            let errorText = String(describing: error)
            return errorText
        }
        
        return "Sorry no fortune - Please try again!"
    }()
}
