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
  
  @IBOutlet weak var txtMarketCap: UILabel!
  @IBOutlet weak var txtSymbol: UILabel!
  @IBOutlet weak var txtPrice: UILabel!
  @IBOutlet weak var imgCoin: UIImageView!
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()    
    presenter?.viewDidLoad()
    //    let viewi = UIView(frame: view.bounds)
    //    viewi.backgroundColor = .red
    //    view.addSubview(viewi)
//    tableView.sectionHeaderHeight = 20
    tableView.register(nibModels: [Usd.self])
  }
  
  //MARK: - PullUpController overrides
  
  override var pullUpControllerPreferredSize: CGSize {
    return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2)
  }
  
  override var pullUpControllerPreviewOffset: CGFloat {
    return UIScreen.main.bounds.height/2
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
  
  func setPrice(_ text: String) {
    txtPrice.text = text
  }
  
  func setMarketCap(_ text: String) {
    txtMarketCap.text = text
  }
  
}

extension CurrencyDetailViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return tableView.dequeueReusableCell(with: presenter!.usd, for: indexPath)
  }

}



















