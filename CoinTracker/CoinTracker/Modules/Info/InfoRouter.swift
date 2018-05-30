//
//  ⚡️Created by Generatus⚡️ on 30.05.2018
// 
//  InfoRouter.swift
//
//  Created by testram
//  Copyright © testram. All rights reserved.
//

import UIKit
import SafariServices
import MessageUI

class InfoRouterImplementation {

  private weak var view: InfoViewController?
  
  init(for view: InfoViewController) {
    self.view = view
  }

}

//MARK: - InfoRouter

extension InfoRouterImplementation: InfoRouter {
  
  func openMailApp() {
    guard let url = URL(string: "mailto:\(Links.mail.description())") else {return}
    UIApplication.shared.open(url)
  }
  
  func openSafari(with url: URL) {
    let vc = SFSafariViewController(url: url)
    view?.present(vc, animated: true, completion: nil)
  }
}
