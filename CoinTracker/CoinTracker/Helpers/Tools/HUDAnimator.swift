//
//  HUDAnimator.swift
//  CoinTracker
//
//  Created by Oleg Ryasnoy on 22.05.2018.
//  Copyright © 2018 Oleg Ryasnoy. All rights reserved.
//

import UIKit
import ImageIO
//TODO: Refactor 
class HUDAnimator: UIView {
  
  /// The object that save all the HUDAnimator options, (colors, corner radius, image name, duration)
  static let options = HUDAnimatorOptions()
  
  static private let view = HUDAnimator()
  
  private let loadingView = UIView()
  
  // MARK: init
  init() {
    super.init(frame: UIApplication.shared.keyWindow?.frame ?? .zero)
    initLoadingView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func initLoadingView() {
    let side = frame.size.width / 3
    let x = frame.midX - (side/2)
    let y = frame.midY - (side/2)
    
    loadingView.frame = CGRect(x: x, y: y, width: side, height: side)
    addSubview(loadingView)
    
    let imageSide = loadingView.frame.size.width / 1.5
    let imageX = loadingView.frame.width/2 - (imageSide/2)
    let imageY = loadingView.frame.height/2 - (imageSide/2)
    let rect =  CGRect(x: imageX, y: imageY, width: imageSide, height: imageSide)
    let imageView = UIImageView(frame: rect)
    
    imageView.contentMode = HUDAnimator.options.contentMode
    imageView.animationImages = animationImages()
    imageView.animationDuration = HUDAnimator.options.animationDuration
    imageView.animationRepeatCount = HUDAnimator.options.animationRepeatCount
    imageView.startAnimating()
    
    loadingView.addSubview(imageView)
  }
  
  private func animationImages() -> [UIImage] {
    guard let url = Bundle.main.url(forResource: HUDAnimator.options.imageName, withExtension: "gif") else {
      fatalError("Please be sure that you have provided the true image name or extension of the image")
    }
    
    guard let imageSource = CGImageSourceCreateWithURL(url as CFURL, nil) else {
      fatalError("Please be sure that you have provided the true image name or extension of the image")
    }
    
    var images: [UIImage] = []
    
    for i in 0..<CGImageSourceGetCount(imageSource) {
      if let image = CGImageSourceCreateImageAtIndex(imageSource, i, nil) {
        images.append(UIImage(cgImage: image))
      }
    }
    
    
    return images
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    if HUDAnimator.options.cancable {
      removeFromSuperview()
    }
  }
  
  static func show() {
    if HUDAnimator.view.superview == nil {
      UIApplication.shared.keyWindow?.addSubview(HUDAnimator.view)
    }
  }
  
  static func dismiss() {
    if HUDAnimator.view.superview != nil {
      HUDAnimator.view.removeFromSuperview()
    }
  }
  
}

// MARK: HUDAnimator Options

class HUDAnimatorOptions {
  /// The duration for the gif image animation, the defualt is `0`.
  var animationDuration = 1.0
  /// The repeat count for the gif image, the default is `0` (Infinity).
  var animationRepeatCount = 0
  /// The gif image name.
  var imageName = "loader"
  /// To determine if the loading view cancelable or not, the defualt is `false`.
  var cancable = false
  /// The gif `imageview` content mode, the defualt is `scaleAspectFit`.
  var contentMode: UIViewContentMode = .scaleAspectFit
}
