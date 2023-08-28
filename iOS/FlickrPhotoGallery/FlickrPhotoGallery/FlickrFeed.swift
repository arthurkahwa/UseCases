//
//  FlickrFeed.swift
//  FlickrPhotoGallery
//
//  Created by Arthur Nsereko Kahwa on 8/28/23.
//

import Foundation

struct FlickrFeed: Codable, Hashable {
  struct Item: Codable, Hashable {
    struct Medium: Codable, Hashable {
      let m: String
    }

    let title: String
    let link: String
    let media: Medium
    let dateTaken: String
    let description: String
    let published: String
    let author: String
    let authorID: String
    let tags: String

    private enum CodingKeys: String, CodingKey {
      case title
      case link
      case media
      case dateTaken = "date_taken"
      case description
      case published
      case author
      case authorID = "author_id"
      case tags
    }
  }

  let title: String
  let link: String
  let description: String
  let modified: String
  let generator: String
  let items: [Item]
}
