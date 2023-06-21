//
//  DataController.swift
//  SwiftUI-CoreData
//
//  Created by Arthur Nsereko Kahwa on 18.01.23.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Bookworm")
    
    init() {
        container.loadPersistentStores { NSEntityDescription, error in
            if let error = error {
                print("Core Date error: \(error.localizedDescription)")
            }
        }
    }
}
