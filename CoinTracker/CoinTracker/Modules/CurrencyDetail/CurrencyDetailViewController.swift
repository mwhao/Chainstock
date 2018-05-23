//
//  ⚡️Created by Generatus⚡️ on 22.05.2018
// 
//  CurrencyDetailViewController.swift
//
//  Created by testram
//  Copyright © testram. All rights reserved.
//

import UIKit

class CurrencyDetailViewController: UIViewController {
  
  var presenter: CurrencyDetailPresenter?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    CurrencyDetailConfiguratorImplementation.configure(for: self)
    presenter?.viewDidLoad()
  }

}

//MARK: - CurrencyDetailView

extension CurrencyDetailViewController: CurrencyDetailView {
  
}




















