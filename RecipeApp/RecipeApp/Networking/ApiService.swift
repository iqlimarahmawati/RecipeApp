//
//  ApiService.swift
//  RecipeApp
//
//  Created by Iqlima Rahmawati on 03/05/23.
//

import Foundation

protocol ApiServiceMealsProtocol {

    mutating func get(url: URL)

    func callApi<T:Codable>(model: T.Type, completion:@escaping (Result<T, Error>) -> Void)
}

struct GetMealsApi: ApiServiceMealsProtocol {

    private var url = URL(string: "")

    mutating func get(url: URL) {
        self.url = url
    }

    func callApi<T>(model: T.Type, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable, T : Encodable {

        guard let url = self.url else { return }

        URLSession.shared.dataTask(with: url) { data,response, error in
            if let data = data {
                do {
                    let modelData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(modelData))
                } catch let error {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
