//
//  Fortune.swift
//  FortuneSDK
//
//  Created by Arthur Nsereko Kahwa on 3/29/23.
//

import Foundation

typealias FortuneTexts = [String: [String]]

class SDK {
    lazy var fortune: String = {
        do {
            if let path = Bundle.main.url(forResource: "FortuneTexts", withExtension: "json") {
                let data = try Data(contentsOf: path)
                
                let fortunes = try JSONDecoder().decode(FortuneTexts.self, from: data)
                
                if let category = fortunes.randomElement(),
                   let fortune = category.value.randomElement() {
                    return fortune
                }
            }
        }
        catch {
            return String(describing: error)
        }
        
        return "Sorry no fortune - Please try again!"
    }()
}
