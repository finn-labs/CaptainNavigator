//
//  TabBarController.swift
//  CaptainNavigator
//
//  Created by Dybdal, Aksel on 26.02.2018.
//  Copyright © 2018 Aksel Dybdal. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    init(title: String) {
        super.init(nibName: nil, bundle: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        for (index, viewController) in childViewControllers.enumerated() {
            if let item = tabBar.items?[index] {
                item.title = viewController.childViewControllers.first?.title
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func append(_ viewController: UIViewController) {
        var mutableViewControllers = viewControllers ?? []
        mutableViewControllers.append(viewController)
        setViewControllers(mutableViewControllers, animated: false)
    }
}
