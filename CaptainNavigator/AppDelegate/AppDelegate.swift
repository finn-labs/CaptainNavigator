//
//  AppDelegate.swift
//  CaptainNavigator
//
//  Created by Dybdal, Aksel on 26.02.2018.
//  Copyright © 2018 Aksel Dybdal. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appNavigator: AppNavigator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let newWindow = UIWindow(frame: UIScreen.main.bounds)

        startNavigator(using: newWindow)
        window = newWindow
        
        return true
    }

    func startNavigator(using window: UIWindow) {
        let container = DependencyContainer()
        appNavigator = AppNavigator(window: window, factory: container)
        appNavigator?.start()
    }
}
