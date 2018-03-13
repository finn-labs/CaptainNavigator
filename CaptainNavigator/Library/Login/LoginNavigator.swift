//
//  LoginNavigator.swift
//  CaptainNavigator
//
//  Created by Dybdal, Aksel on 27.02.2018.
//  Copyright © 2018 Aksel Dybdal. All rights reserved.
//

import Foundation

class LoginNavigator: SubNavigator {

    enum Destination {
        case login
        case signup
        case register
    }

    enum Result {
        case success
        case failed
    }

    typealias Factory =  ProfileFactory & AuthenticationFactory
    typealias LoginCompletion = ((LoginNavigator.Result) -> ())?

    private weak var tabBarController: TabBarController?
    private weak var containerViewController: ContainerViewController?
    private let factory: Factory

    let completion: LoginCompletion

    init(tabBarController: TabBarController, factory: Factory, completion: LoginCompletion) {
        self.tabBarController = tabBarController
        self.factory = factory
        self.completion = completion
    }

    init(containerViewController: ContainerViewController, factory: Factory, completion: LoginCompletion) {
        self.containerViewController = containerViewController
        self.factory = factory
        self.completion = completion
    }

    func start() {
        navigateToLogin()
    }

    func navigate(to destination: LoginNavigator.Destination) {
        switch destination {
        case .login:
            navigateToLogin()

        default:
            break
        }
    }

    private func navigateToLogin() {
        let loginViewController = factory.makeLoginViewController(loginNavigator: self, completion: completion)
        let navigationController = factory.makeNavigationController(rootViewController: loginViewController)

        if let containerViewController = containerViewController {
            containerViewController.activeViewController = navigationController

        } else if let tabBarController = tabBarController {
            tabBarController.append(navigationController)
        }
    }
}
