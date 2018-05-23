//
//  View.swift
//  CoinTracker
//
//  Created by Oleg Ryasnoy on 23.05.2018.
//  Copyright © 2018 Oleg Ryasnoy. All rights reserved.
//

import UIKit

extension UIView {
  
  class func fromNib<T: UIView>() -> T? {
    guard let nib = Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil) else { return nil }
    return nib.first as? T
  }
  
}
