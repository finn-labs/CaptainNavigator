//
//  CaptainAuthenticationService.swift
//  CaptainNavigator
//
//  Created by Dybdal, Aksel on 27.02.2018.
//  Copyright © 2018 Aksel Dybdal. All rights reserved.
//

import Foundation

class CaptainAuthenticationService: AuthenticationService {
    var observers = [WeakObserver<AuthenticationObserver>]()
    var isLoggedIn: Bool = false {
        didSet {
            observers.forEach { observer in observer.reference?.authenticationChanged() }
        }
    }
}
