//
//  RMService.swift
//  RickAndMortyBP
//
//  Created by Bogdan Pankevych on 15.04.2026.
//

import Foundation

/// Primary service to get Rick and Morty Data
class RMService {
    static let shared = RMService()
    private init() {}
    
    
    /// Send request
    /// - Parameters:
    ///   - request: request that will be sended
    ///   - completion: closure that take Result as argument
    func execute<T: Decodable>(_ request: RMRequest,
                               expecting type: T.Type,
                               completion: @escaping (Result<T, Error>) -> Void) {
        let urlRequest = makeUrlRequest(from: request)
        
        let task = URLSession.shared.dataTask(with: urlRequest!) { data, response, error in
            guard let data = data else {
                completion(.failure(error ?? NSError(domain: "", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
//                print(String(describing: decodedData))
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    private func makeUrlRequest(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
    }
}
