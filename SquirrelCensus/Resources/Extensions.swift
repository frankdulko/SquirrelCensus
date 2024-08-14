//
//  Extensions.swift
//  SquirrelCensus
//
//  Created by Frank Dulko on 7/24/24.
//

import Foundation
import Combine

extension URLSession {
//  func fetchSquirrelData(at url: URL, completion: @escaping (Result<[Squirrel], Error>) -> Void) {
//    self.dataTask(with: url) { (data, response, error) in
//      if let error = error {
//        completion(.failure(error))
//      }
//      if let data = data {
//        do {
//          let squirrels = try JSONDecoder().decode([Squirrel].self, from: data)
//          completion(.success(squirrels))
//        } catch let decoderError {
//          completion(.failure(decoderError))
//        }
//      }
//    }.resume()
//  }
    func fetchSquirrelData(at url: URL) -> AnyPublisher<[Squirrel], Error> {
        self.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Squirrel].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
