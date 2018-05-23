//
//  ⚡️Created by Generatus⚡️ on 22.05.2018
//
//  CurrencyDetailConfigurator.swift
//
//  Created by testram
//  Copyright © testram. All rights reserved.
//

import Foundation

protocol CurrencyDetailConfigurator {

  static func configure(for view: CurrencyDetailViewController, with currency: Currency)

}

class CurrencyDetailConfiguratorImplementation {
  
}

extension CurrencyDetailConfiguratorImplementation: CurrencyDetailConfigurator {

  static func configure(for view: CurrencyDetailViewController, with currency: Currency) {

    let router = CurrencyDetailRouterImplementation(for: view)

    let presenter = CurrencyDetailPresenterImplementation(for: view, with: router, currency: currency)
    view.presenter = presenter

  }

}







