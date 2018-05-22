//
//  APIConstants.swift
//  CoinTracker
//
//  Created by Oleg Ryasnoy on 21.05.2018.
//  Copyright © 2018 Oleg Ryasnoy. All rights reserved.
//

import Foundation

enum API {
  
  static let baseURL = "https://api.coinmarketcap.com" + API.version
  static let version = "/v2/"
  
  static let coinsURL = "https://s2.coinmarketcap.com/static/img/coins/"
  
  enum route: String {
    case ticker = "ticker/"
  }
  
}
