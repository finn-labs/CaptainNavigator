//
//  NotificationsViewController.swift
//  CaptainNavigator
//
//  Created by Dybdal, Aksel on 26.02.2018.
//  Copyright © 2018 Aksel Dybdal. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController {

    required init?(coder aDecoder: NSCoder) { fatalError() }

    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Notifications"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }
}
