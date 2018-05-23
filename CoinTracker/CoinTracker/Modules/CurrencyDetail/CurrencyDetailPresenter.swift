//
//  ⚡️Created by Generatus⚡️ on 22.05.2018
// 
//  CurrencyDetailPresenter.swift
//
//  Created by testram
//  Copyright © testram. All rights reserved.
//

import Foundation

protocol CurrencyDetailView: BaseView {
  func setNavigationTitle(_ text: String)
  func setCoinImage(from url: URL)
  func setSymbol(_ text: String)
}

protocol CurrencyDetailPresenter {
  
  func viewDidLoad()
  
}

protocol CurrencyDetailRouter {
  
}

class CurrencyDetailPresenterImplementation {
  
  private weak var view: CurrencyDetailView?
  
  private let router: CurrencyDetailRouter
  
  private let currency: Currency
  //MARK: -
  
  init(for view: CurrencyDetailView, with router: CurrencyDetailRouter, currency: Currency) {
    
    self.view = view
    self.router = router
    self.currency = currency
  }
  
  private func setup() {
    view?.setNavigationTitle(currency.name)
    view?.setSymbol(currency.symbol)
    if let url = currency.imageURL {
      view?.setCoinImage(from: url)
    }
  }
  
}

//MARK: - CurrencyDetailPresenter

extension CurrencyDetailPresenterImplementation: CurrencyDetailPresenter {
  
  func viewDidLoad() {
    setup()
  }
  
}



