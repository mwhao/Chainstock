//
//  PullUpController.swift
//  CoinTracker
//
//  Created by Oleg Ryasnoy on 23.05.2018.
//  Copyright © 2018 Oleg Ryasnoy. All rights reserved.
//

import UIKit

protocol PullUpControllerDelegate: class {
  func topOffsetDidChange(to offset: CGFloat)
}

open class PullUpController: UIViewController {
  
  weak var delegate: PullUpControllerDelegate?
  
  private var leftConstraint: NSLayoutConstraint?
  
  private var topConstraint_: NSLayoutConstraint?
  private var topConstraintConstant: CGFloat? {
    didSet {
      guard let constraint = topConstraint_, let constant = topConstraintConstant else { return }
      constraint.constant = constant
      delegate?.topOffsetDidChange(to: constant)
    }
  }
  private var widthConstraint: NSLayoutConstraint?
  private var heightConstraint: NSLayoutConstraint?
  private var panGestureRecognizer: UIPanGestureRecognizer?
  
  /**
   The closure to execute before the view controller's view move to a sticky point.
   The target sticky point, expressed in the pull up controller coordinate system, is provided in the closure parameter.
   */
  open var willMoveToStickyPoint: ((_ point: CGFloat, _ isOpened: Bool) -> Void)?
  
  /**
   The closure to execute after the view controller's view move to a sticky point.
   The sticky point, expressed in the pull up controller coordinate system, is provided in the closure parameter.
   */
  open var didMoveToStickyPoint: ((_ point: CGFloat, _ isOpened: Bool) -> Void)?
  
  /**
   The desired height in screen units expressed in the pull up controller coordinate system that will be initially showed.
   The default value is 50.
   */
  open var pullUpControllerPreviewOffset: CGFloat {
    return 50
  }
  
  /**
   The desired size of the pull up controller’s view, in screen units.
   The default value is width: UIScreen.main.bounds.width, height: 400.
   */
  open var pullUpControllerPreferredSize: CGSize {
    return CGSize(width: UIScreen.main.bounds.width, height: 400)
  }
  
  /**
   A list of y values, in screen units expressed in the pull up controller coordinate system.
   At the end of the gesture the pull up controller will scroll at the nearest point in the list.
   */
  public final var pullUpControllerAllStickyPoints: [CGFloat] {
    let sc_allStickyPoints = [pullUpControllerPreviewOffset, pullUpControllerPreferredSize.height]
    return sc_allStickyPoints.sorted()
  }
  
  /**
   A Boolean value that determines whether bouncing occurs when scrolling reaches the end of the pull up controller's view size.
   The default value is false.
   */
  open var pullUpControllerIsBouncingEnabled: Bool {
    return false
  }
  
  private var portraitPreviousStickyPointIndex: Int?
  
  //MARK: -
  
  /**
   This method will move the pull up controller's view in order to show the provided visible point.
   
   You may use on of `pullUpControllerAllStickyPoints` item to provide a valid visible point.
   - parameter visiblePoint: the y value to make visible, in screen units expressed in the pull up controller coordinate system.
   - parameter completion: The closure to execute after the animation is completed. This block has no return value and takes no parameters. You may specify nil for this parameter.
   */
  open func pullUpControllerMoveToVisiblePoint(_ visiblePoint: CGFloat, completion: (() -> Void)?) {
    topConstraintConstant = (parent?.view.frame.height ?? 0) - visiblePoint
    
    UIView.animate(withDuration: 0.3,
                   animations: { [weak self] in
                    self?.parent?.view?.layoutIfNeeded()
      },
                   completion: { _ in
                    completion?()
    })
  }
  
  open override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    
    var targetStickyPoint: CGFloat?
    
    if let portraitPreviousStickyPointIndex = portraitPreviousStickyPointIndex,
      portraitPreviousStickyPointIndex < pullUpControllerAllStickyPoints.count {
      
      targetStickyPoint = pullUpControllerAllStickyPoints[portraitPreviousStickyPointIndex]
      self.portraitPreviousStickyPointIndex = nil
    }
    
    coordinator.animate(alongsideTransition: { [weak self] coordinator in
      self?.refreshConstraints(size: size)
      if let targetStickyPoint = targetStickyPoint {
        self?.pullUpControllerMoveToVisiblePoint(targetStickyPoint, completion: nil)
      }
    })
  }
  
  fileprivate func setupPanGestureRecognizer() {
    panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGestureRecognizer(_:)))
    panGestureRecognizer?.minimumNumberOfTouches = 1
    panGestureRecognizer?.maximumNumberOfTouches = 1
    if let panGestureRecognizer = panGestureRecognizer {
      view.addGestureRecognizer(panGestureRecognizer)
    }
  }
  
  private var currentStickyPointIndex: Int {
    let stickyPointTreshold = (self.parent?.view.frame.height ?? 0) - (topConstraint_?.constant ?? 0)
    let stickyPointsLessCurrentPosition = pullUpControllerAllStickyPoints.map { abs($0 - stickyPointTreshold) }
    guard let minStickyPointDifference = stickyPointsLessCurrentPosition.min() else { return 0 }
    return stickyPointsLessCurrentPosition.index(of: minStickyPointDifference) ?? 0
  }
  
  private func nearestStickyPointY(yVelocity: CGFloat) -> CGFloat {
    var currentStickyPointIndex = self.currentStickyPointIndex
    if abs(yVelocity) > 700 { // 1000 points/sec = "fast" scroll
      if yVelocity > 0 {
        currentStickyPointIndex = max(currentStickyPointIndex - 1, 0)
      } else {
        currentStickyPointIndex = min(currentStickyPointIndex + 1, pullUpControllerAllStickyPoints.count - 1)
      }
    }
    
    willMoveToStickyPoint?(pullUpControllerAllStickyPoints[currentStickyPointIndex], currentStickyPointIndex != 0)
    return (parent?.view.frame.height ?? 0) - pullUpControllerAllStickyPoints[currentStickyPointIndex]
  }
  
  @objc private func handlePanGestureRecognizer(_ gestureRecognizer: UIPanGestureRecognizer) {
    guard let topConstraint = topConstraint_,
      let topConstant = topConstraintConstant,
      let parentViewHeight = parent?.view.frame.height else { return }
    
    let yTranslation = gestureRecognizer.translation(in: view).y
    gestureRecognizer.setTranslation(.zero, in: view)
    
    var resultConstant = topConstant
    resultConstant += yTranslation
    
    if !pullUpControllerIsBouncingEnabled {
      resultConstant = max(topConstraint.constant, parentViewHeight - pullUpControllerPreferredSize.height)
      resultConstant = min(topConstraint.constant, parentViewHeight - pullUpControllerPreviewOffset)
    }
    topConstraintConstant = resultConstant
    
    print("Top constraint:", topConstraint.constant)
    
    if gestureRecognizer.state == .ended {
      topConstraint.constant = nearestStickyPointY(yVelocity: gestureRecognizer.velocity(in: view).y)
      animateLayout()
    }
  }
  
  func togglePullUp() {
    let index = (currentStickyPointIndex == 0) ? (pullUpControllerAllStickyPoints.count - 1) : 0
    topConstraintConstant = (parent?.view.frame.height ?? 0) - pullUpControllerAllStickyPoints[index]
    animateLayout()
  }
  
  @objc fileprivate func handleInternalScrollViewPanGestureRecognizer(_ gestureRecognizer: UIPanGestureRecognizer) {
    guard let scrollView = gestureRecognizer.view as? UIScrollView,
      let lastStickyPoint = pullUpControllerAllStickyPoints.last,
      let parentViewHeight = parent?.view.frame.height,
      let topConstraintValue = topConstraint_?.constant
      else { return }
    
    let isScrollingDown = gestureRecognizer.translation(in: view).y > 0
    let shouldScrollingDownTriggerGestureRecognizer = isScrollingDown && scrollView.contentOffset.y <= 0
    let shouldScrollingUpTriggerGestureRecognizer = !isScrollingDown && topConstraintValue != parentViewHeight - lastStickyPoint
    
    if shouldScrollingDownTriggerGestureRecognizer || shouldScrollingUpTriggerGestureRecognizer {
      handlePanGestureRecognizer(gestureRecognizer)
    }
    
    if gestureRecognizer.state.rawValue == 3 { // for some reason gestureRecognizer.state == .ended doesn't work
      topConstraintConstant = nearestStickyPointY(yVelocity: 0)
      animateLayout()
    }
  }
  
  private func animateLayout() {
    UIView.animate(withDuration: 0.3, animations: { [weak self] in
      self?.parent?.view.layoutIfNeeded()
    }) { [weak self] (finished) in
      let point = (self?.parent?.view.frame.height ?? 0.0) - (self?.topConstraint_?.constant ?? 0.0)
      self?.didMoveToStickyPoint?(point, self?.currentStickyPointIndex != 0)
    }
  }
  
  fileprivate func setupConstrains() {
    guard let parentView = parent?.view else { return }
    
    topConstraint_ = view.topAnchor.constraint(equalTo: parentView.topAnchor, constant: parentView.bounds.height)
    leftConstraint = view.leftAnchor.constraint(equalTo: parentView.leftAnchor, constant: 0)
    widthConstraint = view.widthAnchor.constraint(equalToConstant: pullUpControllerPreferredSize.width)
    heightConstraint = view.heightAnchor.constraint(equalToConstant: pullUpControllerPreferredSize.height)
    
    NSLayoutConstraint.activate([topConstraint_, leftConstraint, widthConstraint, heightConstraint].compactMap { $0 })
  }
  
  private func setConstraints(parentViewSize: CGSize) {
    topConstraintConstant = parentViewSize.height - pullUpControllerPreviewOffset
    leftConstraint?.constant = (parentViewSize.width - min(pullUpControllerPreferredSize.width, parentViewSize.width))/2
    widthConstraint?.constant = pullUpControllerPreferredSize.width
    heightConstraint?.constant = pullUpControllerPreferredSize.height
  }
  
  fileprivate func refreshConstraints(size: CGSize) {
    setConstraints(parentViewSize: size)
  }
  
  func closePullUp(animated: Bool, completion: @escaping () -> ()) {
    guard let parentView = parent?.view else { return }
    panGestureRecognizer?.isEnabled = false
    topConstraintConstant = parentView.bounds.height
    if animated {
      UIView.animate(withDuration: 0.3, animations: {
        parentView.layoutIfNeeded()
      }) { [weak self] finished in
        self?.view.removeFromSuperview()
        self?.removeFromParentViewController()
        completion()
      }
    } else {
      parentView.layoutIfNeeded()
      view.removeFromSuperview()
      removeFromParentViewController()
      completion()
    }
  }
}

//MARK: -

extension UIViewController {
  
  /**
   Adds the specified pull up view controller as a child of the current view controller.
   - parameter pullUpController: the pull up controller to add as a child of the current view controller.
   */
  open func addPullUpController(_ pullUpController: PullUpController, isNeedGestures: Bool = true) {
    addChildViewController(pullUpController)
    pullUpController.view.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(pullUpController.view)
    pullUpController.setupConstrains()
    parent?.view.layoutIfNeeded()
    
    UIView.animate(withDuration: 0.3, animations: { [weak self] in
      pullUpController.refreshConstraints(size: self?.view.frame.size ?? .zero)
      self?.parent?.view.layoutIfNeeded()
      self?.view.layoutIfNeeded()
    }) { finished in
      if isNeedGestures {
        pullUpController.setupPanGestureRecognizer()
      }
    }
  }
}

extension UIScrollView {
  
  /**
   Attach the scroll view to the provided pull up controller in order to move it with the scroll view content.
   - parameter pullUpController: the pull up controller to move with the current scroll view content.
   */
  open func attach(to pullUpController: PullUpController) {
    panGestureRecognizer.addTarget(pullUpController, action: #selector(pullUpController.handleInternalScrollViewPanGestureRecognizer(_:)))
  }
}
