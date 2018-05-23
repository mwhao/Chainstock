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
  
  private lazy var refreshControl: UIRefreshControl = {
    let refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
    refreshControl.tintColor = .gray
    return refreshControl
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    ListConfiguratorImplementation.configure(for: self)
    presenter.viewDidLoad()
    setupTableView()
  }
  
  private func setupTableView() {
    tableView.register(nibModels: [Currency.self])
    tableView.addSubview(refreshControl)
  }
  
  @objc func refresh(_ refreshControl: UIRefreshControl) {
    presenter.reloadModels()
  }
  
}

//MARK: - ListView

extension ListViewController: ListView {
  func updateList() {
    tableView.reloadData()
    refreshControl.endRefreshing()
  }
}

extension ListViewController: UITableViewDataSource {
  
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    tableView.separatorStyle = presenter.numberOfCurrencies == 0 ? .none : .singleLine
    return presenter.numberOfCurrencies
  }
  
  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return tableView.dequeueReusableCell(with: presenter.model(at: indexPath.row), for: indexPath)
  }
  
}
