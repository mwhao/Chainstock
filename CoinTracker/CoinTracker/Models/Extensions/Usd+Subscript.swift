//
//  UsdSubscripter.swift
//  CoinTracker
//
//  Created by Oleg Ryasnoy on 24.05.2018.
//  Copyright © 2018 Oleg Ryasnoy. All rights reserved.
//

import Foundation

extension Usd {
  subscript(period: ChangePeriod) -> (period: String, percent: Double) {
    get {
      switch period {
      case .hour: return ("Hour", percentChange1H)
      case .day: return ("Day", percentChange24H)
      case .week: return ("Week", percentChange7D)
      }
    }
  }
}
