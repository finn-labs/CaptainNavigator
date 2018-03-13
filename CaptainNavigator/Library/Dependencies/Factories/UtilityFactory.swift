//
//  UtilityFactory.swift
//  CaptainNavigator
//
//  Created by Dybdal, Aksel on 26.02.2018.
//  Copyright © 2018 Aksel Dybdal. All rights reserved.
//

import Foundation

protocol DatabaseFactory: Factory {
    var database: Database { get }
}

protocol AuthenticationFactory: Factory {
    var authenticationService: AuthenticationService { get }
}
