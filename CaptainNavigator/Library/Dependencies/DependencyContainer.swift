//
//  DependencyContainer.swift
//  CaptainNavigator
//
//  Created by Dybdal, Aksel on 26.02.2018.
//  Copyright © 2018 Aksel Dybdal. All rights reserved.
//

import UIKit

typealias UtilityFactory = DatabaseFactory & AuthenticationFactory

class DependencyContainer: UtilityFactory {
    lazy var database: Database = CaptainDatabase()
    lazy var authenticationService: AuthenticationService = CaptainAuthenticationService()
}

extension DependencyContainer: AppFactory {

    func makeMarketsNavigator(tabBarController: TabBarController) -> MarketsNavigator {
        return MarketsNavigator(tabBarController: tabBarController, factory: self)
    }

    func makeNotificationsNavigator(tabBarController: TabBarController) -> NotificationsNavigator {
        return NotificationsNavigator(tabBarController: tabBarController, factory: self)
    }

    func makeProfileNavigator(tabBarController: TabBarController) -> ProfileNavigator {
        return ProfileNavigator(tabBarController: tabBarController, factory: self)
    }
}

extension DependencyContainer: ViewControllerFactory {

    func makeTabBarController() -> TabBarController {
        return TabBarController(title: "")
    }

    func makeNavigationController(rootViewController: UIViewController) -> NavigationController {
        return NavigationController(rootViewController: rootViewController)
    }

    func makeContainerViewController() -> ContainerViewController {
        return ContainerViewController()
    }
}

extension DependencyContainer: LoginFactory {

    func makeLoginNavigator(tabBarController: TabBarController, completion: LoginNavigator.LoginCompletion) -> LoginNavigator {
        return LoginNavigator(tabBarController: tabBarController, factory: self, completion: completion)
    }

    func makeLoginNavigator(containerViewController: ContainerViewController, completion: LoginNavigator.LoginCompletion) -> LoginNavigator {
        return LoginNavigator(containerViewController: containerViewController, factory: self, completion: completion)
    }
}

extension DependencyContainer: MarketsFactory {

    func makeMarketsViewController(marketsNavigator: MarketsNavigator) -> MarketsViewController {
        return MarketsViewController(authenticationService: authenticationService, navigator: marketsNavigator)
    }

    func makeAdViewController(ad: Ad) -> AdViewController {
        return AdViewController(ad: ad, database: database)
    }

    func makeSearchViewController() -> SearchViewController {
        return SearchViewController(database: database)
    }
}

extension DependencyContainer: NotificationsFactory {

    func makeNotificationsViewController() -> NotificationsViewController {
        return NotificationsViewController()
    }
}

extension DependencyContainer: ProfileFactory {

    func makeProfileViewController(profileNavigator: ProfileNavigator) -> ProfileViewController {
        return ProfileViewController(authenticationService: authenticationService, navigator: profileNavigator)
    }

    func makeLoginViewController(loginNavigator: LoginNavigator, completion: LoginNavigator.LoginCompletion) -> LoginViewController {
        return LoginViewController(authenticationService: authenticationService, navigator: loginNavigator, completion: completion)
    }
}
