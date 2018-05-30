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
  
  @objc private func refresh(_ refreshControl: UIRefreshControl) {
    presenter.reloadModels()
  }
  
  
  @objc private func tap(sender: UITapGestureRecognizer) {
    presenter.didTap()
  }
  
  @IBAction private func btnInfoPressed(_ sender: UIBarButtonItem) {
    presenter.getInfo()
  }
  
}

//MARK: - ListView

extension ListViewController: ListView {
  
  func updateList() {
    tableView.reloadData()
    refreshControl.endRefreshing()
  }
  
  //TODO: - Move to PullUpController
  func addBlurView() {
    let visual = UIVisualEffectView(frame: UIScreen.main.bounds)
    UIView.animate(withDuration: 0.3) {
      visual.effect = UIBlurEffect(style: .dark)
    }
    let tap = UITapGestureRecognizer(target: self, action: #selector(tap(sender:)))
    view.addGestureRecognizer(tap)
    view.addSubview(visual)
  }
  
  func removeBlurView() {
    let visual = view.subviews.first(where: {$0 is UIVisualEffectView})
    UIView.animate(withDuration: 0.3, animations: {
      visual?.alpha = 0
    }) { (finish) in
      visual?.removeFromSuperview()
    }
    view.gestureRecognizers?.forEach { view.removeGestureRecognizer($0)}
  }
  
}

extension ListViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    tableView.separatorStyle = presenter.numberOfCurrencies == 0 ? .none : .singleLine
    return presenter.numberOfCurrencies
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return tableView.dequeueReusableCell(with: presenter.currency(at: indexPath.row), for: indexPath)
  }
  
}

extension ListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    presenter.selectCurrency(at: indexPath.row)
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
