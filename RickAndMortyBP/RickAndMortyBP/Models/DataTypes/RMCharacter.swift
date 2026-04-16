//
//  RMCharacter.swift
//  RickAndMortyBP
//
//  Created by Bogdan Pankevych on 15.04.2026.
//

struct RMCharacter: Codable {
    let id: Int
    let name: String
    let status: RMCharacterStatus
    let species: String
    let type: String
    let gender: RMGender
    let origin: RMOrigin
    let location: RMOrigin
    let image: String
    let episode: [String]
}

enum RMGender: String, Codable {
    case male = "Male"
    case female = "Female"
    case genderless = "Genderless"
    case unknown = "unknown"
}

enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

struct RMOrigin: Codable {
    let name: String
    let url: String
}


