//
//  ⚡️Created by Generatus⚡️ on 30.05.2018
//
//  InfoConfigurator.swift
//
//  Created by testram
//  Copyright © testram. All rights reserved.
//

import Foundation

protocol InfoConfigurator {

  static func configure(for view: InfoViewController)

}

class InfoConfiguratorImplementation {
  
}

extension InfoConfiguratorImplementation: InfoConfigurator {

  static func configure(for view: InfoViewController) {

    let router = InfoRouterImplementation(for: view)
    
    let presenter = InfoPresenterImplementation(for: view, with: router)
    view.presenter = presenter

  }

}







