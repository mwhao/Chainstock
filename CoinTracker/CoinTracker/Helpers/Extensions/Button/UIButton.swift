//
//  UIButton.swift
//  CoinTracker
//
//  Created by Oleg Ryasnoy on 30.05.2018.
//  Copyright © 2018 Oleg Ryasnoy. All rights reserved.
//

import UIKit

extension UIButton {
  func underline() {
    guard let text = titleLabel?.text else { return }
    let attributedString = NSMutableAttributedString(string: text)
    attributedString.addAttribute(NSAttributedStringKey.underlineStyle, value: NSUnderlineStyle.styleSingle.rawValue, range: NSRange(location: 0, length: text.count))
    
    setAttributedTitle(attributedString, for: .normal)
  }
}

