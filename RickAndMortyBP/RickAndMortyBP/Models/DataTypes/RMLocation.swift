//
//  RMLocation.swift
//  RickAndMortyBP
//
//  Created by Bogdan Pankevych on 15.04.2026.
//

struct RMLocation: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
}
