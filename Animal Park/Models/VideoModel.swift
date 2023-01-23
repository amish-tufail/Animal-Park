//
//  VideoModel.swift
//  Animal Park
//
//  Created by Amish Tufail on 23/01/2023.
//

import Foundation

struct Video: Codable, Identifiable {
    var id: String
    var name: String
    var headline: String
    var thumbnail: String {
        "video-\(id)"
    }
}
