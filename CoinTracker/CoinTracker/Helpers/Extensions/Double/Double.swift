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
    return result
  }
  //TODO: - RELOGIC
  func shiftConvert() -> String {
    let decimal = NSDecimalNumber(value: self)
    var descriptor = String(describing: decimal)
    var sign = ""
    if descriptor.hasPrefix("-") {
      sign = "-"
      descriptor.removeFirst()
    }
    
    let components = descriptor.components(separatedBy: ".")
    guard let toPoint = components.first, let fromPoint = components.last else {return "\(self)"}

    var pointed = ""
    
    for (index, char) in fromPoint.enumerated() {
      if char == "0" {
        pointed.append(char)
      } else {
        fromPoint.count-1 > index ? pointed.append("\(char)\(fromPoint[index+1])") : pointed.append(char)
        break
      }
    }
    return sign + toPoint + "." + pointed
    
  }
  
}


