//
//  AuthenticationObserver.swift
//  CaptainNavigator
//
//  Created by Dybdal, Aksel on 27.02.2018.
//  Copyright © 2018 Aksel Dybdal. All rights reserved.
//

import Foundation

protocol AuthenticationObserver: NSObjectProtocol {
    func authenticationChanged()
}
