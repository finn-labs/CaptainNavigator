//
//  ProfileNavigator.swift
//  CaptainNavigator
//
//  Created by Dybdal, Aksel on 26.02.2018.
//  Copyright © 2018 Aksel Dybdal. All rights reserved.
//

import UIKit

class ProfileNavigator: Navigator {

    enum Destination {
        case login
        case profile
    }

    typealias Factory = ProfileFactory & AuthenticationFactory

    private weak var tabBarController: TabBarController?
    private weak var containerViewController: ContainerViewController?
    private let factory: Factory

    init(tabBarController: TabBarController, factory: Factory) {
        self.tabBarController = tabBarController
        self.factory = factory
    }

    func start() {
        let containerViewController = factory.makeContainerViewController()
        containerViewController.title = "Profile"

        tabBarController?.append(containerViewController)

        self.containerViewController = containerViewController

        if factory.authenticationService.isLoggedIn {
            navigate(to: .profile)
        } else {
            navigate(to: .login)
        }
    }

    func navigate(to destination: ProfileNavigator.Destination) {
        guard let containerViewController = containerViewController else {
            return
        }

        switch destination {
        case .login:
            let loginNavigator = factory.makeLoginNavigator(containerViewController: containerViewController, completion: loginDidFinish)
            loginNavigator.start()

        case .profile:
            let profileViewController = factory.makeProfileViewController(profileNavigator: self)
            let navigationController = factory.makeNavigationController(rootViewController: profileViewController)
            containerViewController.activeViewController = navigationController
        }
    }

    private func loginDidFinish(result: LoginNavigator.Result) {
        navigate(to: .profile)
    }
}
