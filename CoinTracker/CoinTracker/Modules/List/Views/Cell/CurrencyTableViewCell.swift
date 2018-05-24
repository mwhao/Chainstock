//
//  CurrencyTableViewCell.swift
//  CoinTracker
//
//  Created by Oleg Ryasnoy on 21.05.2018.
//  Copyright © 2018 Oleg Ryasnoy. All rights reserved.
//

import UIKit
import Nuke

class CurrencyTableViewCell: UITableViewCell {
  
  @IBOutlet fileprivate weak var txtTitle: UILabel!
  @IBOutlet fileprivate weak var txtPrice: UILabel!
  @IBOutlet fileprivate weak var imgCoin: UIImageView!
  
}

extension Currency: CellViewModel {
  func setup(cell: CurrencyTableViewCell) {
    cell.txtTitle.text = name
    cell.txtPrice.text = "$ \(quotes.usd.price)"
    cell.txtPrice.textColor = UIColor.CoinDetail.growth(quotes.usd.percentChange1H).dematerialize()
    guard let imageURL = imageURL else {return}
    Nuke.loadImage(with: imageURL, into: cell.imgCoin)
  }
}


