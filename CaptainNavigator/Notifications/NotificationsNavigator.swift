//
//  NotificationsNavigator.swift
//  CaptainNavigator
//
//  Created by Dybdal, Aksel on 27.02.2018.
//  Copyright © 2018 Aksel Dybdal. All rights reserved.
//

import Foundation

class NotificationsNavigator: Navigator {

    enum Destination {
        case notifications
    }

    typealias Factory = NotificationsFactory

    private weak var tabBarController: TabBarController?
    private weak var navigationController: NavigationController?
    private let factory: Factory

    init(tabBarController: TabBarController, factory: Factory) {
        self.tabBarController = tabBarController
        self.factory = factory
    }

    func start() {
        let notificationsViewController = factory.makeNotificationsViewController()
        let navigationController = factory.makeNavigationController(rootViewController: notificationsViewController)
        tabBarController?.append(navigationController)
    }

    func navigate(to destination: NotificationsNavigator.Destination) {
        // Not able to navigate
    }
}
