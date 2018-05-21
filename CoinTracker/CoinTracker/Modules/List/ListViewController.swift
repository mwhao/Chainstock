//
//  ⚡️Created by Generatus⚡️ on 21.05.2018
// 
//  ListViewController.swift
//
//  Created by testram
//  Copyright © testram. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
  
  @IBOutlet private weak var tableView: UITableView!
  
  var presenter: ListPresenter!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    ListConfiguratorImplementation.configure(for: self)
    tableView.register(nibModels: [Currency.self])
    presenter.viewDidLoad()
  }
  
}

//MARK: - ListView

extension ListViewController: ListView {
  func updateList() {
    tableView.reloadData()
  }
}

extension ListViewController: UITableViewDataSource {
  
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter.numberOfCurrencies
  }
  
  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return tableView.dequeueReusableCell(with: presenter.model(at: indexPath.row), for: indexPath)
  }
  
}
