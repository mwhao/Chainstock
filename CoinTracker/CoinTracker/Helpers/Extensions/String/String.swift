//
//  String.swift
//  CoinTracker
//
//  Created by Oleg Ryasnoy on 28.05.2018.
//  Copyright © 2018 Oleg Ryasnoy. All rights reserved.
//

import Foundation

extension String {
  subscript (i: Int) -> Character {
    return self[index(startIndex, offsetBy: i)]
  }
}
