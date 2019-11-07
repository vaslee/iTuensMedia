//
//  Media.swift
//  Media
//
//  Created by TingxinLi on 11/1/19.
//  Copyright © 2019 TingxinLi. All rights reserved.
//

import Foundation

struct MediaData: Codable {
    
    let feed: MediaWarpper?
    
}

struct MediaWarpper: Codable {
    let title: String
    var results: [Media]
    
}

struct Media: Codable {
    let artistName : String
    let releaseDate: String
    let name: String
    let kind: String
    let copyright: String
    let artistUrl: URL
    let artworkUrl100 : String
}
