//
//  CharacterCollectionViewCEllViewModel.swift
//  RickAndMortyBP
//
//  Created by Bogdan Pankevych on 16.04.2026.
//

import Foundation

final class CharacterCollectionViewCellViewModel {
    let name: String
    let status: String
    let imageURL: URL?
    
    init (name: String, status: String, imageURL: URL?) {
        self.name = name
        self.status = status
        self.imageURL = imageURL
    }
    
    func fetchImage(complition: @escaping (Result<Data, Error>) -> Void) {
        // TODO: Exstract to image manager
        guard let url = imageURL else {
            complition(.failure(URLError(.badURL)))
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                complition(.failure(error ?? URLError(.badURL)))
                return
            }
            
            complition(.success(data))
        }
        task.resume()
    }
    
    
}
