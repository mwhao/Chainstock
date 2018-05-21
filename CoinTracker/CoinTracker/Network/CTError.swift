//
//  CTError.swift
//  CoinTracker
//
//  Created by Oleg Ryasnoy on 21.05.2018.
//  Copyright © 2018 Oleg Ryasnoy. All rights reserved.
//

import Foundation

class CTError: LocalizedError {
  
  private var desc: String? 
  init(str: String? = "") {
    desc = str
  }
  
  var errorDescription: String? {
    return desc
  }
}

