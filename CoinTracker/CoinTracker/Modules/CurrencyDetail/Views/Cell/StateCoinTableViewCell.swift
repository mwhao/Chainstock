//
//  StateCoinTableViewCell.swift
//  CoinTracker
//
//  Created by Oleg Ryasnoy on 24.05.2018.
//  Copyright © 2018 Oleg Ryasnoy. All rights reserved.
//

import UIKit

class StateCoinTableViewCell: UITableViewCell {

  @IBOutlet weak var txtTitle: UILabel!
  @IBOutlet weak var imgPercentGrowth: UIImageView!
  @IBOutlet weak var txtPercentGrowth: UILabel!
  @IBOutlet weak var imgValueGrowth: UIImageView!
  @IBOutlet weak var txtValueGrowth: UILabel!
  @IBOutlet weak var txtCalculatedValue: UILabel!
  
}

extension Usd: CellViewModel {
  func setup(cell: StateCoinTableViewCell) {
    guard let changePeriod = ChangePeriod(rawValue: cell.tag) else {return}
    cell.txtTitle.text = self[changePeriod].period
    cell.txtPercentGrowth.text = "\(self[changePeriod].percent) %"
    
    let diff = price ^% self[changePeriod].percent
    let caluculated = Float(price - (diff))
    cell.txtValueGrowth.text = "$ \(diff)"
    
    cell.txtCalculatedValue.text = "$ \(caluculated)"
    
    cell.txtValueGrowth.textColor = UIColor.CoinDetail.growth(self[changePeriod].percent).dematerialize()
    cell.txtPercentGrowth.textColor = UIColor.CoinDetail.growth(self[changePeriod].percent).dematerialize()
    
    cell.imgValueGrowth.image = self[changePeriod].percent > 0 ? #imageLiteral(resourceName: "icon_value_up") : #imageLiteral(resourceName: "icon_value_down")
    cell.imgPercentGrowth.image = self[changePeriod].percent > 0 ? #imageLiteral(resourceName: "icon_percent_up") : #imageLiteral(resourceName: "icon_percent_down")
    
  }
}


