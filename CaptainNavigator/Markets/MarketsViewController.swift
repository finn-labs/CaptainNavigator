//
//  MarketsViewController.swift
//  CaptainNavigator
//
//  Created by Dybdal, Aksel on 26.02.2018.
//  Copyright © 2018 Aksel Dybdal. All rights reserved.
//

import UIKit

class MarketsViewController: UIViewController {

    private let navigator: MarketsNavigator
    private let authenticationService: AuthenticationService

    private var marketsView: MarketsView {
        return view as! MarketsView
    }

    required init?(coder aDecoder: NSCoder) { fatalError() }

    init(authenticationService: AuthenticationService, navigator: MarketsNavigator) {
        self.authenticationService = authenticationService
        self.navigator = navigator

        super.init(nibName: nil, bundle: nil)

        title = "Markets"

        authenticationService.add(observer: self)
    }

    deinit {
        authenticationService.remove(observer: self)
    }

    override func loadView() {
        view = MarketsView(delegate: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        marketsView.statusLabel.text = authenticationService.isLoggedIn ? "Logged in" : "Logged out"
    }
}

extension MarketsViewController: MarketsViewDelegate {

    func didTapAdButton() {
        let ad = Ad()
        navigator.navigate(to: .ad(ad: ad))
    }

    func didTapSearchButton() {
        navigator.navigate(to: .search)
    }
}

extension MarketsViewController: AuthenticationObserver {

    func authenticationChanged() {
        marketsView.statusLabel.text = authenticationService.isLoggedIn ? "Logged in" : "Logged out"
    }
}
