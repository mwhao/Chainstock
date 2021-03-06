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
  func addBlurView()
  func removeBlurView()
}

protocol ListPresenter {
  
  var numberOfCurrencies: Int {get}
  
  func viewDidLoad()
  func reloadModels()
  func currency(at index: Int) -> Currency
  func selectCurrency(at index: Int)
  func didTap()
  func getInfo()
}

protocol ListRouter {
  func openDetail(for currency: Currency)
  func closeDetail()
  func openInfo()
}

class ListPresenterImplementation {
  
  private weak var view: ListView?
  
  private let router: ListRouter
  
  private var currencies = [Currency]() {
    didSet {
      DispatchQueue.main.async { self.view?.updateList() }
    }
  }
  
  //MARK: -
  
  init(for view: ListView, with router: ListRouter) {
    
    self.view = view
    self.router = router
    
  }
  
  private func loadModels(_ then: emptyCompletion? = nil) {
    Network.shared.getCurrencies { result in
      switch result {
      case .success(let data):
        self.currencies = data
      case .failure(let error):
        self.view?.showError(error.localizedDescription)
      }
      DispatchQueue.main.async { then?() }
    }
  }
  
}

//MARK: - ListPresenter

extension ListPresenterImplementation: ListPresenter {

  var numberOfCurrencies: Int {
    return currencies.count
  }
  
  func viewDidLoad() {
    HUDAnimator.show()
    loadModels {
      HUDAnimator.dismiss()
    }
  }
  
  func reloadModels() {
    loadModels()
  }
  
  func currency(at index: Int) -> Currency {
    return currencies[index]
  }
  
  func selectCurrency(at index: Int) {
    let coin = currency(at: index)
    view?.addBlurView()
    router.openDetail(for: coin)
  }
  
  func didTap() {
    view?.removeBlurView()
    router.closeDetail()
  }
  
  func getInfo() {
    router.openInfo()
  }
  
}



