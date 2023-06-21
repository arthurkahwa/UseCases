//
//  ContentView.swift
//  Async_Await-Json_Decoder
//
//  Created by Arthur Nsereko Kahwa on 10.01.23.
//

import SwiftUI

struct Photo: Codable, Identifiable {
    let id: Int
    let albumID: Int
    let title: String
    let url: URL
    let thumbnailURL: URL
    
    private enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id
        case title
        case url
        case thumbnailURL = "thumbnailUrl"
    }
}

class ContentViewModel: ObservableObject {
    @Published var photoes = [Photo]()
    
    @MainActor
    func fetchData() async {
        let path = "https://jsonplaceholder.typicode.com/photos"
        
        guard let url = URL(string: path)
        else {
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            self.photoes = try JSONDecoder().decode([Photo].self, from: data)       }
        catch {
            print("CAnnot contact endpoint: \(error)")
        }
    }
}

struct DetailView: View {
    var item: Photo
    
    var body: some View {
        ScrollView {
            Text(item.title)
                .font(.title)
            
            AsyncImage(url: item.url) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }
            
        }
    }
}

struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationView {
            List (viewModel.photoes) { photo in
                
                NavigationLink {
                    DetailView(item: photo)
                } label: {
                    AsyncImage(url: photo.thumbnailURL) { image in
                        image.resizable()
                            .frame(width: 100, height: 100, alignment: .leading)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Text(photo.title)
                }
            }
            .refreshable {
                await viewModel.fetchData()
            }
            .task {
                await viewModel.fetchData()
            }
            .navigationTitle("Photos")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
