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
  func setVersion(_ text: String)
}

protocol InfoPresenter {

  func viewDidLoad()
  func link(with tag: Int)
  func sendMail()
  
}

protocol InfoRouter {
  func openSafari(with url: URL)
  func openMailApp()
}

class InfoPresenterImplementation {

  private weak var view: InfoView?
  
  private let router: InfoRouter
  
  //MARK: -
  
  init(for view: InfoView, with router: InfoRouter) {

    self.view = view
    self.router = router

  }
  
  private func appVersion() -> String {
    guard let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else {return ""}
    return "v \(version)"
  }

}

//MARK: - InfoPresenter

extension InfoPresenterImplementation: InfoPresenter {

  func viewDidLoad() {
    view?.setVersion(appVersion())
  }
  
  func link(with tag: Int) {
    guard let link = Links(rawValue: tag), let url = URL(string: link.description()) else {return}
    router.openSafari(with: url)
  }

  func sendMail() {
    router.openMailApp()
  }
  
}

