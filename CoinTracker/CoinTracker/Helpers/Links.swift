//
//  Links.swift
//  CoinTracker
//
//  Created by Oleg Ryasnoy on 30.05.2018.
//  Copyright © 2018 Oleg Ryasnoy. All rights reserved.
//

import Foundation

enum Links: Int {
  case github
  case telegram
  case mail
  
  func description() -> String {
    switch self {
    case .github: return "https://github.com/Chainstock-Community/Chainstock"
    case .telegram: return "https://t.me/chainstock"
    case .mail: return "help.chainstock@gmail.com"
    }
  }
}
