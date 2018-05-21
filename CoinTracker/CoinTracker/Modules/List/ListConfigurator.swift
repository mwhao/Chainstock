//
//  ⚡️Created by Generatus⚡️ on 21.05.2018
//
//  ListConfigurator.swift
//
//  Created by testram
//  Copyright © testram. All rights reserved.
//

import Foundation

protocol ListConfigurator {

  static func configure(for view: ListViewController)

}

class ListConfiguratorImplementation {
  
}

extension ListConfiguratorImplementation: ListConfigurator {

  static func configure(for view: ListViewController) {

    let router = ListRouterImplementation(for: view)
    
    let presenter = ListPresenterImplementation(for: view, with: router)
    view.presenter = presenter

  }

}







