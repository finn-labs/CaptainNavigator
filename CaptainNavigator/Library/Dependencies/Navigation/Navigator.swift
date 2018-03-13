//
//  Navigator.swift
//  CaptainNavigator
//
//  Created by Dybdal, Aksel on 26.02.2018.
//  Copyright © 2018 Aksel Dybdal. All rights reserved.
//

import Foundation

protocol Navigator {
    associatedtype Destination

    func start()
    func navigate(to destination: Destination)
}

protocol SubNavigator: Navigator {
    associatedtype Result

    var completion: ((Result) -> ())? { get }
}
