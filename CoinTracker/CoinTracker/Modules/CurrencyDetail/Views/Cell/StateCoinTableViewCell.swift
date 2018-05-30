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
    let changePercent = self[changePeriod].percent
    
    cell.txtTitle.text = self[changePeriod].period
    
    guard abs(changePercent) != 0 else {return}
    let diff = price ^% changePercent
    let caluculated = price - (diff)
    cell.txtValueGrowth.text = "$ \(diff.shiftConvert())"
    
    cell.txtCalculatedValue.text = "$ \(caluculated.shiftConvert())"
    cell.txtPercentGrowth.text = "\(changePercent) %"
    cell.txtValueGrowth.textColor = UIColor.CoinDetail.growth(changePercent).dematerialize()
    cell.txtPercentGrowth.textColor = UIColor.CoinDetail.growth(changePercent).dematerialize()
    
    
    
    cell.imgValueGrowth.image = changePercent > 0 ? #imageLiteral(resourceName: "icon_value_up") : #imageLiteral(resourceName: "icon_value_down")
    cell.imgPercentGrowth.image = changePercent > 0 ? #imageLiteral(resourceName: "icon_percent_up") : #imageLiteral(resourceName: "icon_percent_down")
    
  }
}


