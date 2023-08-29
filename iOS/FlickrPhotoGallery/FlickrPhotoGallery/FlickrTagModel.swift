//
//  FlickrTagModel.swift
//  FlickrPhotoGallery
//
//  Created by Arthur Nsereko Kahwa on 8/29/23.
//

import SwiftData

@Model
class FlickrTagModel {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
