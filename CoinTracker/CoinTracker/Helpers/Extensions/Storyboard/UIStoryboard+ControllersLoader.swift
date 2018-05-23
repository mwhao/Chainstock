//
//  UIStoryboard.swift
//  CoinTracker
//
//  Created by Oleg Ryasnoy on 23.05.2018.
//  Copyright © 2018 Oleg Ryasnoy. All rights reserved.
//

import UIKit

protocol StoryboardInstantiable {
  static var storyboardIdentifier: String { get }
}


extension UIViewController: StoryboardInstantiable {}

extension UIStoryboard {
  
  enum Storyboard: String {
    case CurrencyDetail
    
    var filename: String {
      return rawValue
    }
  }
  
  convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
    self.init(name: storyboard.filename, bundle: bundle)
  }
  
  func instantiateViewController<T>() -> T where T: StoryboardInstantiable {
    guard let viewController = instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
      fatalError("Couldn't instantiate view controller with identifier \(T.storyboardIdentifier)")
    }
    return viewController
  }
  
}


extension StoryboardInstantiable where Self: UIViewController {
  
  static var storyboardIdentifier: String {
    return String(describing: self)
  }
  
  static func create(of storyboard: UIStoryboard.Storyboard) -> Self {
    return UIStoryboard(storyboard: storyboard).instantiateViewController()
  }
  
}

