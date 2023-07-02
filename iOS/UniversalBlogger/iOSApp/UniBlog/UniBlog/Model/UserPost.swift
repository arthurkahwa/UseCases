//
//  UserPost.swift
//  UniBlog
//
//  Created by Arthur Nsereko Kahwa on 02.07.23.
//

import Foundation

struct UserPost: Codable, Identifiable {
    let id: Int
    let username: String
    let email: String
    let posts: [Post]
}
