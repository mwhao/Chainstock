//
//  AppDelegate.swift
//  CoinTracker
//
//  Created by Oleg Ryasnoy on 21.05.2018.
//  Copyright © 2018 Oleg Ryasnoy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    theme()
    return true
  }

  func applicationWillTerminate(_ application: UIApplication) {
    CoreDataStack.shared.saveContext()
  }


}

//TODO: -
func theme() {
  UINavigationBar.appearance().barTintColor = UIColor(hex: "123962")
  UINavigationBar.appearance().tintColor = .white
  let attributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "Montserrat-Medium", size: 17)!]
  UINavigationBar.appearance().titleTextAttributes = attributes
  // 123962 dark blue
  // 799EB3 gray blue
  // 13ACE4 sky blue
  // 3157A4 deep blue
  // B1D6E8 white blue
}

