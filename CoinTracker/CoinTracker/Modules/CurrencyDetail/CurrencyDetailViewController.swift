//
//  ⚡️Created by Generatus⚡️ on 22.05.2018
// 
//  CurrencyDetailViewController.swift
//
//  Created by testram
//  Copyright © testram. All rights reserved.
//

import UIKit
import Nuke

class CurrencyDetailViewController: PullUpController {
  
  var presenter: CurrencyDetailPresenter?
  
  @IBOutlet weak var txtSymbol: UILabel!
  @IBOutlet weak var imgCoin: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()    
    presenter?.viewDidLoad()
  }
  
  //MARK: - PullUpController overrides
  
  override var pullUpControllerPreferredSize: CGSize {
    return CGSize(width: UIScreen.main.bounds.width, height: 300)
  }
  
  override var pullUpControllerPreviewOffset: CGFloat {
    return 300
  }
  
}

//MARK: - CurrencyDetailView

extension CurrencyDetailViewController: CurrencyDetailView {
  func setNavigationTitle(_ text: String) {
    title = text
  }
  
  func setCoinImage(from url: URL) {
    Nuke.loadImage(with: url, into: imgCoin)
  }
  
  func setSymbol(_ text: String) {
    txtSymbol.text = text
  }
  
}




















