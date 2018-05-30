//
//  ⚡️Created by Generatus⚡️ on 30.05.2018
// 
//  InfoViewController.swift
//
//  Created by testram
//  Copyright © testram. All rights reserved.
//

import UIKit
import MessageUI

class InfoViewController: UIViewController {
  
  @IBOutlet private weak var txtVersion: UILabel!
  @IBOutlet private var btnsInfo: [UIButton]!
  
  var presenter: InfoPresenter?
  
  override func viewDidLoad() {
    btnsInfo.forEach {
      $0.underline()
      $0.isExclusiveTouch = true
    }
    super.viewDidLoad()
    InfoConfiguratorImplementation.configure(for: self)
    presenter?.viewDidLoad()
    
  }
  
  @IBAction private func btnHelpPressed(_ sender: UIButton) {
    presenter?.sendMail()
  }
  
  @IBAction private func btnLinkPressed(_ sender: UIButton) {
    presenter?.link(with: sender.tag)
  }


}

//MARK: - InfoView

extension InfoViewController: InfoView {
  func setVersion(_ text: String) {
    txtVersion.text = text
  }
}














