//
//  WeakObserver.swift
//  CaptainNavigator
//
//  Created by Dybdal, Aksel on 13.03.2018.
//  Copyright © 2018 Aksel Dybdal. All rights reserved.
//

import Foundation

struct WeakObserver<T> {
    private weak var _reference: AnyObject?

    var reference: T? {
        return _reference as? T
    }

    init(object: T) {
        _reference = object as AnyObject
    }
}
