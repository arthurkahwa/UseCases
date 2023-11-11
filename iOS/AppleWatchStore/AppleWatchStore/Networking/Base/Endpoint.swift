//
//  Endpoint.swift
//  AppleWatchStore
//
//  Created by Arthur Nsereko Kahwa on 11/11/23.
//

import Foundation

protocol Endpoint {
    var schema: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod  { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
    var port: Int { get }
}

extension Endpoint {
    var schema: String { "http" }
    
    var host: String { "127.0.0.1" }
    
    var port: Int { 3000 }
}
