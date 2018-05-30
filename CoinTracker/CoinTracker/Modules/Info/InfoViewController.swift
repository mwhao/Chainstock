//
//  ⚡️Created by Generatus⚡️ on 30.05.2018
// 
//  InfoViewController.swift
//
//  Created by testram
//  Copyright © testram. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
  
  var presenter: InfoPresenter?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    InfoConfiguratorImplementation.configure(for: self)
    presenter?.viewDidLoad()
  }

}

//MARK: - InfoView

extension InfoViewController: InfoView {
  
}




















