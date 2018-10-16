//
//  NetworkClient.swift
//  swql
//
//  Created by Aleksandar Mihailovski on 2018-10-14.
//  Copyright © 2018 Aleksandar Mihailovski. All rights reserved.
//

import Foundation
import Apollo

class NetworkClient {
    let apollo: ApolloClient

    init(apollo: ApolloClient = ApolloClient(url: NetworkConfig.swapiEndpoint)) {
        self.apollo = apollo
    }
}

extension NetworkClient {
    typealias Cursor = String

    enum Result<T> {
        case success(T)
        case failure(NetworkError)
    }

    struct Paged<S> where S: Sequence {
        let totalCount: Int
        let hasNext: Bool
        let cursor: Cursor
        let characters: S
    }
}
