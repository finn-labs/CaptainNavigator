//
//  AuthenticationService.swift
//  CaptainNavigator
//
//  Created by Dybdal, Aksel on 27.02.2018.
//  Copyright © 2018 Aksel Dybdal. All rights reserved.
//

import Foundation

protocol AuthenticationService: class {
    var isLoggedIn: Bool { get set }

    var observers: [WeakObserver<AuthenticationObserver>] { get set }

    func add(observer: AuthenticationObserver)
    func remove(observer: AuthenticationObserver)
}

extension AuthenticationService {

    func add(observer: AuthenticationObserver) {
        guard observers.index(where: { ob in ob.reference === observer}) == nil else {
            return // Already registered
        }

        observers.append(WeakObserver(object: observer))
    }

    func remove(observer: AuthenticationObserver) {
        if let index = observers.index(where: { ob in ob.reference === observer }) {
            observers.remove(at: index)
        }
    }
}
