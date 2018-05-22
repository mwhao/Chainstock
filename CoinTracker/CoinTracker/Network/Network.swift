//
//  Network.swift
//  CoinTracker
//
//  Created by Oleg Ryasnoy on 21.05.2018.
//  Copyright © 2018 Oleg Ryasnoy. All rights reserved.
//

import Foundation

final class Network {
  static let shared = Network()
  
  /// Private init for singletonity
  private init() { }
  
  /// Create URL for route (concatinate with server url)
  ///
  /// - Parameter route: route without hostname
  /// - Returns: valid url
  private func url(for route: API.route) -> URL? {
    return URL(string: API.baseURL + route.rawValue)
  }
  
  func getCurrencies(_ then: @escaping (Result<[Currency]>) -> ()) {
    guard let url = url(for: .ticker) else {return}
    let request = URLRequest(url: url)
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      guard let data = data else {
        //FIXME: - Refactor it
        let errorDescription = error?.localizedDescription
        then(.failure(CTError(str: errorDescription)))
        return
      }
      
      do {
        let response = try JSONDecoder().decode(RawServerResponse.self, from: data)
        let result = response.data.values.sorted(by: {$0.rank < $1.rank})
        then(.success(result))
      } catch {
        then(.failure(CTError(str: error.localizedDescription)))
      }
      
    }
    task.resume()
  }
  
  
  
}
