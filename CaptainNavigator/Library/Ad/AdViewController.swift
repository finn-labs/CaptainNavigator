//
//  AdViewController.swift
//  CaptainNavigator
//
//  Created by Dybdal, Aksel on 26.02.2018.
//  Copyright © 2018 Aksel Dybdal. All rights reserved.
//

import UIKit

class AdViewController: UIViewController {

    private let ad: Ad
    private let database: ReadableDatabase

    required init?(coder aDecoder: NSCoder) { fatalError() }

    init(ad: Ad, database: ReadableDatabase) {
        self.ad = ad
        self.database = database

        super.init(nibName: nil, bundle: nil)

        title = database.adName
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue

        let barButtonItem = UIBarButtonItem(title: "Lukk", style: .plain, target: self, action: #selector(close(_:)))
        navigationItem.leftBarButtonItem = barButtonItem
    }

    @objc private func close(_ sender: UIBarButtonItem) {
        dismiss(animated: true) // Is this correct or should we have a navigator to handle it? Or should we use .navigate on the MarketsNavigator
    }
}
