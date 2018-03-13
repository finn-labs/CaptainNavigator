//
//  LoginViewController.swift
//  CaptainNavigator
//
//  Created by Dybdal, Aksel on 26.02.2018.
//  Copyright © 2018 Aksel Dybdal. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    private let authenticationService: AuthenticationService
    private let navigator: LoginNavigator
    private let completion: LoginNavigator.LoginCompletion

    required init?(coder aDecoder: NSCoder) { fatalError() }

    init(authenticationService: AuthenticationService, navigator: LoginNavigator, completion: LoginNavigator.LoginCompletion) {
        self.navigator = navigator
        self.authenticationService = authenticationService
        self.completion = completion
        super.init(nibName: nil, bundle: nil)
        title = "Login"
        view = LoginView(delegate: self)
    }
}

extension LoginViewController: LoginViewDelegate {

    func didTapLogIn() {
        authenticationService.isLoggedIn = true
        completion?(.success)
    }
}
