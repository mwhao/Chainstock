//
//  Result.swift
//  CoinTracker
//
//  Created by Oleg Ryasnoy on 21.05.2018.
//  Copyright © 2018 Oleg Ryasnoy. All rights reserved.
//

import Foundation

enum Result<T> {
  case success(T)
  case failure(Error)
  
  @discardableResult
  public func dematerialize() throws -> T {
    switch self {
    case let .success(value): return value
    case let .failure(error): throw error
    }
  }
}
