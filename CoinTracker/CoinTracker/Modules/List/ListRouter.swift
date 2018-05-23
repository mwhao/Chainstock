//
//  ⚡️Created by Generatus⚡️ on 21.05.2018
// 
//  ListRouter.swift
//
//  Created by testram
//  Copyright © testram. All rights reserved.
//

import UIKit

class ListRouterImplementation {

  private weak var view: ListViewController?
  
  init(for view: ListViewController) {
    self.view = view
  }

}

//MARK: - ListRouter

extension ListRouterImplementation: ListRouter {
  func openDetail(for currency: Currency) {
    let controller = CurrencyDetailViewController.create(of: .CurrencyDetail)
    view?.navigationController?.show(controller, sender: view)
  }
}


