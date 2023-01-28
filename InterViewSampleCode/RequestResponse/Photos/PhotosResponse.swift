//
//  PhotosResponse.swift
//  InterViewSampleCode
//
//  Created by Amrendra on 28/01/23.
//

import Foundation

struct PhotosResponse: Decodable {
    
    let albumID: Int //": 1,
    let photoID: Int //": 1,
    let title: String? //": "accusamus beatae ad facilis cum similique qui sunt",
    let thumbnailBigUrl: String? //": "https://via.placeholder.com/600/92c952",
    let thumbanilSmallUrl: String? //": "https://via.placeholder.com/150/92c952"
    
    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case photoID = "id"
        case title
        case thumbnailBigUrl = "url"
        case thumbanilSmall = "thumbnailUrl"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        albumID = try container.decode(Int.self, forKey: .albumID)
        photoID = try container.decode(Int.self, forKey: .photoID)
        title = try? container.decode(String.self, forKey: .title)
        thumbnailBigUrl = try? container.decode(String.self, forKey: .thumbnailBigUrl)
        thumbanilSmallUrl = try? container.decode(String.self, forKey: .thumbanilSmall)
    }
}


/*
 {
     "albumId": 1,
     "id": 1,
     "title": "accusamus beatae ad facilis cum similique qui sunt",
     "url": "https://via.placeholder.com/600/92c952",
     "thumbnailUrl": "https://via.placeholder.com/150/92c952"
   },
 */
