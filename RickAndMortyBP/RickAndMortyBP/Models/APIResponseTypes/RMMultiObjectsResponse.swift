//
//  RMMultiObjectResponse.swift
//  RickAndMortyBP
//
//  Created by Bogdan Pankevych on 15.04.2026.
//

struct RMMultiObjectsResponse<T: Codable>: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let nextUrl: String?
        let prevUrl: String?
    }
    
    let info: Info
    let results: [T]
}
