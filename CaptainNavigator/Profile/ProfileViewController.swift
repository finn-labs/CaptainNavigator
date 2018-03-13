//
//  ProfileViewController.swift
//  CaptainNavigator
//
//  Created by Dybdal, Aksel on 26.02.2018.
//  Copyright © 2018 Aksel Dybdal. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    private let authenticationService: AuthenticationService
    private let navigator: ProfileNavigator

    required init?(coder aDecoder: NSCoder) { fatalError() }

    init(authenticationService: AuthenticationService, navigator: ProfileNavigator) {
        self.navigator = navigator
        self.authenticationService = authenticationService
        super.init(nibName: nil, bundle: nil)
        title = "Profile"
        view = ProfileView(delegate: self)
    }
}

extension ProfileViewController: ProfileViewDelegate {

    func didTapLogOut() {
        authenticationService.isLoggedIn = false
        navigator.navigate(to: .login)
    }
}
