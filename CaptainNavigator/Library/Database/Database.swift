//
//  Database.swift
//  CaptainNavigator
//
//  Created by Dybdal, Aksel on 26.02.2018.
//  Copyright © 2018 Aksel Dybdal. All rights reserved.
//

import Foundation

typealias Database = ReadableDatabase & WriteableDatabase

protocol ReadableDatabase {
    var adName: String { get }
}

protocol WriteableDatabase {
    var searchName: String { get }
}
