//
//  RMRequest.swift
//  RickAndMortyBP
//
//  Created by Bogdan Pankevych on 15.04.2026.
//


import Foundation

class RMRequest {
    private struct Constants {
        static let baseURLString = "https://rickandmortyapi.com/api"
    }
    
    private let endpoint: RMEndpoint
    private let pathComponents: [String]
    private let queryItems: [URLQueryItem]
    
    /// Constructed url for the api request in string format
    private var urlString: String {
        var string = Constants.baseURLString
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryItems.isEmpty {
            string += "?"
            let argumentString = queryItems.compactMap({
                guard let value = $0.value else {
                    return nil
                }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        
        return string
    }
    
    let httpMethod = "GET"

    var url: URL? {
        return URL(string: urlString)
    }
    
    init(endpoint: RMEndpoint, pathComponents: [String] = [], queryItems: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryItems = queryItems
    }
}
