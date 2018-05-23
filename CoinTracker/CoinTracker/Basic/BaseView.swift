//
//  BaseView.swift
//  CoinTracker
//
//  Created by Oleg Ryasnoy on 21.05.2018.
//  Copyright © 2018 Oleg Ryasnoy. All rights reserved.
//

import UIKit

protocol BaseView: class {
  func showError(_ message: String)
  func setUserInteraction(_ userInteraction: Bool)
}

extension BaseView where Self: UIViewController {
  func showError(_ message: String) {
    let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
    present(alert, animated: true, completion: nil)
  }
  
  func setUserInteraction(_ userInteraction: Bool) {
    view.isUserInteractionEnabled = userInteraction
  }
  
}

