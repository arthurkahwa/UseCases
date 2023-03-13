//
//  ContentView.swift
//  SwiftUI-CoreData
//
//  Created by Arthur Nsereko Kahwa on 18.01.23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Student.name, ascending: true)]) var students: FetchedResults<Student>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(students) { student in
                    Text(student.name ?? "N/A")
                }
                .onDelete(perform: deleteStudent)
            }
            .navigationTitle("Students")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addRandomStudent) {
                        Label("Add student", systemImage: "plus")
                    }
                }
            }
        }
        .padding()
    }
    
    fileprivate func addRandomStudent() {
        let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
        let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
        
        let chosenFirstName = firstNames.randomElement()!
        let chosenLastName = lastNames.randomElement()!
        
        let student = Student(context: managedObjectContext)
        student.id = UUID()
        student.name = "\(chosenLastName), \(chosenFirstName)"
        
        try? managedObjectContext.save()
    }
    
    fileprivate func deleteStudent(offsets: IndexSet) {
        offsets.map {
            students[$0]
        }
        .forEach(managedObjectContext.delete)
        
        try? managedObjectContext.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
