//
//  ContentView.swift
//  FlickrPhotoGallery
//
//  Created by Arthur Nsereko Kahwa on 8/28/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var viewModel = ViewModel()
//    @Query(sort: \.name) var tags: [FlickrTagModel]
    
    var body: some View {
        VStack {
            Text("Flickr Public Photos")
                .font(.largeTitle)
                .fontWeight(.black)
                .padding()
            
            NavigationSplitView {
                TextField(text: $viewModel.enteredTag) {
                    Text("Enter a Tag")
                        .font(.system(size: 24))
                        .padding()
                }
                .onSubmit {
                    viewModel.flickrTags.insert(viewModel.enteredTag.lowercased())
                    viewModel.selectedTag = viewModel.enteredTag
                    viewModel.save()
                    viewModel.enteredTag = ""
                }
                
                List(viewModel.savedTags,
                     id: \.name,
                     selection: $viewModel.selectedTag) { flickrTag in
                    Text(flickrTag.name)
                        .font(.system(size: 28))
                }
                     .navigationTitle("Tags")
                     .onChange(of: viewModel.selectedTag) {
                         Task {
                             await viewModel.getFlickrFeed()
                         }
                     }
                     .task {
                         await viewModel.getFlickrFeed()
                     }
            } detail: {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.photos, id: \.self) { photo in
                            GeometryReader { geometry in
                                AsyncImage(url: photo) { image in
                                    image
                                        .resizable()
                                        .rotation3DEffect(
                                            Angle(degrees: getPercentage(of: geometry) * 90),
                                            axis: (x: -0.1,
                                                   y: 1.0,
                                                   z: -0.1)
                                        )
                                } placeholder: {
                                    ProgressView()
                                }
                            }
                            .scaledToFit()
                            .padding()
                        }
                    }
                }
                .navigationTitle(viewModel.selectedTag!)
            }
            .padding()
        }
    }
    
    func getPercentage(of geometry: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geometry.frame(in: .global).midX
        
        return Double(1 - (currentX / maxDistance))
    }
}

#Preview {
    ContentView()
}
