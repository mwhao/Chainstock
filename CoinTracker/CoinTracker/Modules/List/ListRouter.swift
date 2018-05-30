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
    CurrencyDetailConfiguratorImplementation.configure(for: controller, with: currency)
    view?.addPullUpController(controller)
  }
  
  func closeDetail() {
    let controller = view?.childViewControllers.first(where: {$0 is CurrencyDetailViewController}) as? CurrencyDetailViewController
    controller?.closePullUp(animated: true, completion: {})
  }
  
  func openInfo() {
    let controller = InfoViewController.create(of: .Info)
    view?.navigationController?.show(controller, sender: view)
  }

}


