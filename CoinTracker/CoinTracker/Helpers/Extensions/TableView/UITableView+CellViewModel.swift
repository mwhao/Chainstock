//
//  UITableView.swift
//  CoinTracker
//
//  Created by Oleg Ryasnoy on 21.05.2018.
//  Copyright © 2018 Oleg Ryasnoy. All rights reserved.
//

import UIKit

extension UITableView {
  func dequeueReusableCell(with model: CellAnyViewModel, for indexPath: IndexPath) -> UITableViewCell {
    let identifier = String(describing: type(of: model).cellAnyType)
    let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    cell.tag = indexPath.row
    model.setupAny(cell: cell)
    return cell
  }
  
  func register(nibModels: [CellAnyViewModel.Type]) {
    nibModels.forEach {
      let identifier = String(describing: $0.cellAnyType)
      let nib = UINib(nibName: identifier, bundle: nil)
      register(nib, forCellReuseIdentifier: identifier)
    }
  }
  
}
