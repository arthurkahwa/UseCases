//
//  SwiftUI_CoreDataApp.swift
//  SwiftUI-CoreData
//
//  Created by Arthur Nsereko Kahwa on 18.01.23.
//

import SwiftUI

@main
struct SwiftUI_CoreDataApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
