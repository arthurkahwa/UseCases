//
//  ViewModel.swift
//  FlickrPhotoGallery
//
//  Created by Arthur Nsereko Kahwa on 8/28/23.
//

import SwiftUI
import SwiftData

@Observable
class ViewModel {
    var photos: [URL] = []
    var selectedTag: String? = "landscape"
    var enteredTag = ""
    let configuration = ModelConfiguration("flickrConfiguration", readOnly: false)
    var context: ModelContext { ModelContext(try! ModelContainer(for: FlickrTagModel.self, configuration))}
//    var context: ModelContext { ModelContext(try! ModelContainer(for: FlickrTagModel.self, configuration: configuration)) }
    
    var savedTags: [FlickrTagModel] {
        let fetchedTags = FetchDescriptor<FlickrTagModel>(sortBy: [SortDescriptor(\.name)])
        
        do {
            return try context.fetch(fetchedTags)
        }
        catch { return [] }
    }
    
    var flickrTags: Set<String> = ["landscape", "nasa", "night", "blackandwhite", "sea", "sun", "lake", "garden", "tree", "portrait", "macro", "blue", "bridge", "orange", "bird", "white", "old", "city", "music", "art", "river", "sky", "snow", "light", "dog", "cat", "yellow", "house", "people", "trees", "nature", "bw", "flower", "family", "sommer", "clouds", "food", "spacex", "car", "new", "moon", "sunset", "street", "water", "christmas", "pink", "park", "winter", "beach", "green"]
    
    var publicFlickrUrl: Result<URL, AppError> {
        let path = "https://api.flickr.com/services/feeds/photos_public.gne?tags=\(selectedTag!)&format=json&nojsoncallback=1"
        guard let url = URL(string: path)
        else {
            return .failure(.badUrl)
        }
        
        return.success(url)
    }
    
    
    init() {
        Task {
            await getFlickrFeed()
        }
    }
    
    func getFlickrFeed() async {
        switch publicFlickrUrl {
        case .success(let url):
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let feed = try JSONDecoder().decode(FlickrFeed.self, from: data)
                
                photos.removeAll()
                
                feed.items.forEach { item in
                    if let url = URL(string: item.media.m) {
                        photos.append(url)
                    }
                }
            }
            catch {}
        case .failure(_):
            break
        }
    }
    
    func allTags() -> [FlickrTagModel] {
        let savedTags = FetchDescriptor<FlickrTagModel>(sortBy: [SortDescriptor(\.name)])
        
        do {
            let results = try context.fetch(savedTags)
            
            return results
        }
        catch {
            return []
        }
    }
    
    func save() {
        let tag = FlickrTagModel(name: enteredTag)
        context.insert(tag)
    }
}
