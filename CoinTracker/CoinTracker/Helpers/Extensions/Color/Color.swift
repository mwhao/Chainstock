//
//  Color.swift
//  CoinTracker
//
//  Created by Oleg Ryasnoy on 24.05.2018.
//  Copyright © 2018 Oleg Ryasnoy. All rights reserved.
//

import UIKit
//TODO: - relogic
extension UIColor {
  enum CoinDetail {
    case growth(Double)
    func dematerialize() -> UIColor {
      switch self {
      case .growth(let percent) where percent > 0: return .init(red: 10/255, green: 186/255, blue: 188/255, alpha: 1)
      case .growth(let percent) where percent < 0 : return .init(red: 226/255, green: 115/255, blue: 93/255, alpha: 1)
      default: return .black
      }
    }
  }
}

