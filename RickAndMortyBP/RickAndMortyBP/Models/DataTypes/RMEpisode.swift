//
//  rmEpisode.swift
//  RickAndMortyBP
//
//  Created by Bogdan Pankevych on 15.04.2026.
//

struct RMEpisode: Codable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    let characters: [String]
    
    enum CodingKeys: String, CodingKey {
        case id, name, episode, characters
        case airDate = "air_date"
    }
}
