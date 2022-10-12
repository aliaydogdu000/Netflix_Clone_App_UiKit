//
//  YoutubeSearchResults.swift
//  Netflix Clone App
//
//  Created by Ali Aydoğdu on 12.10.2022.
//

import Foundation

struct YoutubeSearchResponse:Codable {
    let items : [VideoElement]
}
struct VideoElement:Codable{
    let id: IDVideoElement
}
struct IDVideoElement:Codable{
    let kind:String
    let videoId:String
}
