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
    return true
  }

  func applicationWillTerminate(_ application: UIApplication) {
    CoreDataStack.shared.saveContext()
  }


}

