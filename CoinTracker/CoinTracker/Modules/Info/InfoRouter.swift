//
//  ⚡️Created by Generatus⚡️ on 30.05.2018
// 
//  InfoRouter.swift
//
//  Created by testram
//  Copyright © testram. All rights reserved.
//

import UIKit

class InfoRouterImplementation {

  private weak var view: InfoViewController?
  
  init(for view: InfoViewController) {
    self.view = view
  }

}

//MARK: - InfoRouter

extension InfoRouterImplementation: InfoRouter {
  
}
