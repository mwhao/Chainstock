//
//  ⚡️Created by Generatus⚡️ on 22.05.2018
// 
//  CurrencyDetailPresenter.swift
//
//  Created by testram
//  Copyright © testram. All rights reserved.
//

import Foundation

protocol CurrencyDetailView: class {
  
}

protocol CurrencyDetailPresenter {

  func viewDidLoad()

}

protocol CurrencyDetailRouter {
  
}

class CurrencyDetailPresenterImplementation {

  private weak var view: CurrencyDetailView?
  
  private let router: CurrencyDetailRouter
  
  //MARK: -
  
  init(for view: CurrencyDetailView, with router: CurrencyDetailRouter) {

    self.view = view
    self.router = router

  }

}

//MARK: - CurrencyDetailPresenter

extension CurrencyDetailPresenterImplementation: CurrencyDetailPresenter {

  func viewDidLoad() {
    
  }

}



