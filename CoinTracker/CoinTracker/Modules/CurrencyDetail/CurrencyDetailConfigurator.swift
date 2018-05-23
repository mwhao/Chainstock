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

  static func configure(for view: CurrencyDetailViewController)

}

class CurrencyDetailConfiguratorImplementation {
  
}

extension CurrencyDetailConfiguratorImplementation: CurrencyDetailConfigurator {

  static func configure(for view: CurrencyDetailViewController) {

    let router = CurrencyDetailRouterImplementation(for: view)
    
    let presenter = CurrencyDetailPresenterImplementation(for: view, with: router)
    view.presenter = presenter

  }

}







