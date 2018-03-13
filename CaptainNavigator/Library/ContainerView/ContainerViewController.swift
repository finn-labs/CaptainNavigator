//
//  ContainerViewController.swift
//  CaptainNavigator
//
//  Created by Dybdal, Aksel on 26.02.2018.
//  Copyright © 2018 Aksel Dybdal. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    var activeViewController: UIViewController? {
        didSet {
            if activeViewController != oldValue {
                removeInactiveViewController(inactiveViewController: oldValue)
                updateActiveViewController()
            }
        }
    }

    private func removeInactiveViewController(inactiveViewController: UIViewController?) {
        if let inActiveVC = inactiveViewController {
            inActiveVC.willMove(toParentViewController: nil)
            inActiveVC.view.removeFromSuperview()
            inActiveVC.removeFromParentViewController()
        }
    }

    private func updateActiveViewController() {
        if let activeVC = activeViewController {
            addChildViewController(activeVC)
            activeVC.view.frame = view.bounds
            view.addSubview(activeVC.view)
            activeVC.didMove(toParentViewController: self)
        }
    }
}
