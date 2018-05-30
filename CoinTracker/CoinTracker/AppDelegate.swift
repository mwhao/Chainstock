//
//  AppDelegate.swift
//  CoinTracker
//
//  Created by Oleg Ryasnoy on 21.05.2018.
//  Copyright © 2018 Oleg Ryasnoy. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    appConfiguration()
    return true
  }
  
  func appConfiguration() {
    Fabric.with([Crashlytics.self])
    UINavigationBar.appearance().barTintColor = UIColor(hex: "123962")
    UINavigationBar.appearance().tintColor = .white
    let attributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "Montserrat-Medium", size: 17)!]
    UINavigationBar.appearance().titleTextAttributes = attributes
  }

}


