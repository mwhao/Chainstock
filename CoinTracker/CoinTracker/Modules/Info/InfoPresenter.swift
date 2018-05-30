//
//  ⚡️Created by Generatus⚡️ on 30.05.2018
// 
//  InfoPresenter.swift
//
//  Created by testram
//  Copyright © testram. All rights reserved.
//

import Foundation

protocol InfoView: class {
  
}

protocol InfoPresenter {

  func viewDidLoad()

}

protocol InfoRouter {
  
}

class InfoPresenterImplementation {

  private weak var view: InfoView?
  
  private let router: InfoRouter
  
  //MARK: -
  
  init(for view: InfoView, with router: InfoRouter) {

    self.view = view
    self.router = router

  }

}

//MARK: - InfoPresenter

extension InfoPresenterImplementation: InfoPresenter {

  func viewDidLoad() {
    
  }

}



