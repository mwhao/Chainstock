//
//  CurrencyTableViewCell.swift
//  CoinTracker
//
//  Created by Oleg Ryasnoy on 21.05.2018.
//  Copyright © 2018 Oleg Ryasnoy. All rights reserved.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {
  
  @IBOutlet fileprivate weak var txtTitle: UILabel!
  @IBOutlet fileprivate weak var txtPrice: UILabel!
  
}

extension Currency: CellViewModel {
  func setup(cell: CurrencyTableViewCell) {
    cell.txtTitle.text = name
    cell.txtPrice.text = "\(quotes.usd.price)"
  }
}
