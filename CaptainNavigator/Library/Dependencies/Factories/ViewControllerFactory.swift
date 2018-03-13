//
//  ViewControllerFactory.swift
//  CaptainNavigator
//
//  Created by Dybdal, Aksel on 26.02.2018.
//  Copyright © 2018 Aksel Dybdal. All rights reserved.
//

import UIKit

protocol AppFactory: Factory {
    func makeMarketsNavigator(tabBarController: TabBarController) -> MarketsNavigator
    func makeNotificationsNavigator(tabBarController: TabBarController) -> NotificationsNavigator
    func makeProfileNavigator(tabBarController: TabBarController) -> ProfileNavigator
}

protocol LoginFactory: Factory {
    func makeLoginNavigator(tabBarController: TabBarController, completion: LoginNavigator.LoginCompletion) -> LoginNavigator
    func makeLoginNavigator(containerViewController: ContainerViewController, completion: LoginNavigator.LoginCompletion) -> LoginNavigator
}

protocol ViewControllerFactory: LoginFactory {
    func makeTabBarController() -> TabBarController
    func makeNavigationController(rootViewController: UIViewController) -> NavigationController
    func makeContainerViewController() -> ContainerViewController
}

protocol MarketsFactory: ViewControllerFactory {
    func makeMarketsViewController(marketsNavigator: MarketsNavigator) -> MarketsViewController
    func makeAdViewController(ad: Ad) -> AdViewController
    func makeSearchViewController() -> SearchViewController
}

protocol NotificationsFactory: ViewControllerFactory {
    func makeNotificationsViewController() -> NotificationsViewController
}

protocol ProfileFactory: ViewControllerFactory {
    func makeProfileViewController(profileNavigator: ProfileNavigator) -> ProfileViewController
    func makeLoginViewController(loginNavigator: LoginNavigator, completion: LoginNavigator.LoginCompletion) -> LoginViewController
}
