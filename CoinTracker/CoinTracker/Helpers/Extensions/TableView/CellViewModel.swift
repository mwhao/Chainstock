//
//  CellViewModel.swift
//  CoinTracker
//
//  Created by Oleg Ryasnoy on 21.05.2018.
//  Copyright © 2018 Oleg Ryasnoy. All rights reserved.
//

import UIKit

protocol CellAnyViewModel {
  static var cellAnyType: UIView.Type { get }
  func setupAny(cell: UIView)
}

protocol CellViewModel: CellAnyViewModel {
  associatedtype CellType: UIView
  func setup(cell: CellType)
}

extension CellViewModel {
  static var cellAnyType: UIView.Type {
    return CellType.self
  }
  func setupAny(cell: UIView) {
    if let cell = cell as? CellType {
      setup(cell: cell)
    } else {
      //TODO: Handle this
      assertionFailure("Error: \(#function) \(#file) \(#line)")
    }
    
  }
}
