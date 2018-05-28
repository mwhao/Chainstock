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
    var describe = String(describing: decimal)
    var sign = ""
    if describe.hasPrefix("-") {
      sign = "-"
      describe.removeFirst()
    }
    
    let components = describe.components(separatedBy: ".")
    guard let toPoint = components.first, let fromPoint = components.last else {return "\(self)"}
    guard toPoint.count == 1 else {return sign + toPoint}
    
    var com = ""
    
    for (index, value) in fromPoint.enumerated() {
      if value == "0" {
        com.append(value)
      } else {
        if fromPoint.count-1 > index {
          let next = fromPoint[index+1]
          com.append("\(value)\(next)")
        } else {
          com.append(value)
        }
        break
      }
    }
    return sign + toPoint + "." + com
    
  }
  
  
}


