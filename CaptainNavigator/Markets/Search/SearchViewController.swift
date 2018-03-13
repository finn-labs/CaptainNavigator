//
//  SearchViewController.swift
//  CaptainNavigator
//
//  Created by Dybdal, Aksel on 26.02.2018.
//  Copyright © 2018 Aksel Dybdal. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    private let database: WriteableDatabase

    required init?(coder aDecoder: NSCoder) { fatalError() }

    init(database: WriteableDatabase) {
        self.database = database

        super.init(nibName: nil, bundle: nil)

        title = database.searchName
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
    }

}
