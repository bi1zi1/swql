//
//  NetworkError.swift
//  swql
//
//  Created by Aleksandar Mihailovski on 2018-10-14.
//  Copyright © 2018 Aleksandar Mihailovski. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case generic
    case noData

    init(_ error: Error) {
        if let error = error as? NetworkError {
            self = error
        } else {
            print(error)
            self = .generic
        }
    }
}
