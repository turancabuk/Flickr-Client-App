//
//  Photos.swift
//  Flickr Client App
//
//  Created by Turan Çabuk on 18.09.2022.
//

import Foundation

struct Photos: Codable {
    let page: Int?
    let pages: Int?
    let perpage: Int?
    let total: Int?
    let photo: [Photo]?
}
