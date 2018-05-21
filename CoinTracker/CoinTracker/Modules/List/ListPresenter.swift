//
//  ⚡️Created by Generatus⚡️ on 21.05.2018
// 
//  ListPresenter.swift
//
//  Created by testram
//  Copyright © testram. All rights reserved.
//

import Foundation

protocol ListView: BaseView {
  func updateList()
}

protocol ListPresenter {
  
  var numberOfCurrencies: Int {get}
  
  func viewDidLoad()
  func model(at index: Int) -> Currency
}

protocol ListRouter {
  
}

class ListPresenterImplementation {
  
  private weak var view: ListView?
  
  private let router: ListRouter
  
  private var currencies = [Currency]() {
    didSet {
      DispatchQueue.main.async {
        self.view?.updateList()
      }
    }
  }
  
  //MARK: -
  
  init(for view: ListView, with router: ListRouter) {
    
    self.view = view
    self.router = router
    
  }
  
}

//MARK: - ListPresenter

extension ListPresenterImplementation: ListPresenter {
  
  var numberOfCurrencies: Int {
    return currencies.count
  }
  
  func model(at index: Int) -> Currency {
    return currencies[index]
  }
  
  func viewDidLoad() {
    Network.shared.getCurrencies { result in
      switch result {
      case .success(let data):
        self.currencies = data
      case .failure(let error):
        self.view?.showError(error.localizedDescription)
      }
    }
  }
  
}



