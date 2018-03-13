//
//  AppNavigator.swift
//  CaptainNavigator
//
//  Created by Dybdal, Aksel on 27.02.2018.
//  Copyright © 2018 Aksel Dybdal. All rights reserved.
//

import UIKit

class AppNavigator: Navigator {

    enum Destination {
        case root
    }

    typealias Factory = AppFactory & ViewControllerFactory

    private let factory: Factory
    private let window: UIWindow
    private weak var tabBarController: TabBarController?

    private var marketNavigator: MarketsNavigator?
    private var notificationsNavigator: NotificationsNavigator?
    private var profileNavigator: ProfileNavigator?

    init(window: UIWindow, factory: Factory) {
        self.factory = factory
        self.window = window
    }

    func start() {
        let tabBarController = factory.makeTabBarController()
        marketNavigator = factory.makeMarketsNavigator(tabBarController: tabBarController)
        notificationsNavigator = factory.makeNotificationsNavigator(tabBarController: tabBarController)
        profileNavigator = factory.makeProfileNavigator(tabBarController: tabBarController)

        window.rootViewController = tabBarController
        window.makeKeyAndVisible()

        marketNavigator?.start()
        notificationsNavigator?.start()
        profileNavigator?.start()

        self.tabBarController = tabBarController
    }

    func navigate(to destination: AppNavigator.Destination) {
        tabBarController = TabBarController(title: "hello")
    }
}
