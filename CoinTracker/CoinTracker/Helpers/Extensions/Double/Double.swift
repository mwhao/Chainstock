//
//  Double.swift
//  CoinTracker
//
//  Created by Oleg Ryasnoy on 24.05.2018.
//  Copyright © 2018 Oleg Ryasnoy. All rights reserved.
//

import Foundation

infix operator ^%

extension Double {
  
  static func ^%(lhs: Double, rhs: Double) -> Double {
    let result = (lhs/100) * (rhs)
    return result.roundToDecimal(2)
  }
  
  func roundToDecimal(_ fractionDigits: Int) -> Double {
    let multiplier = pow(10, Double(fractionDigits))
    return Darwin.round(self * multiplier) / multiplier
  }
  
}

