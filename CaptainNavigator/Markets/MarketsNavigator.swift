//
//  MarketsNavigator.swift
//  CaptainNavigator
//
//  Created by Dybdal, Aksel on 26.02.2018.
//  Copyright © 2018 Aksel Dybdal. All rights reserved.
//

import UIKit

class MarketsNavigator: Navigator {

    enum Destination {
        case markets
        case search
        case ad(ad: Ad)
    }

    typealias Factory = MarketsFactory & DatabaseFactory & AuthenticationFactory

    private weak var tabBarController: TabBarController?
    private weak var navigationController: NavigationController?
    private let factory: Factory

    init(tabBarController: TabBarController, factory: Factory) {
        self.tabBarController = tabBarController
        self.factory = factory
    }

    func start() {
        let marketsViewController = factory.makeMarketsViewController(marketsNavigator: self)
        let navigationController = factory.makeNavigationController(rootViewController: marketsViewController)

        tabBarController?.append(navigationController)
        
        self.navigationController = navigationController
    }

    func navigate(to destination: MarketsNavigator.Destination) {
        switch destination {
        case .markets:
            navigationController?.popToRootViewController(animated: true)

        case .search:
            let searchViewController = factory.makeSearchViewController()
            navigationController?.pushViewController(searchViewController, animated: true)

        case .ad(let ad):
            let adViewController = factory.makeAdViewController(ad: ad)
            let adNavigationController = NavigationController(rootViewController: adViewController)
            navigationController?.present(adNavigationController, animated: true)
        }
    }
}
