//
//  CharacterClient.swift
//  swql
//
//  Created by Aleksandar Mihailovski on 2018-10-14.
//  Copyright © 2018 Aleksandar Mihailovski. All rights reserved.
//

import Foundation
import Apollo

final class CharacterClient: NetworkClient {
    typealias Character = CharacterListQuery.Data.AllPerson.Person
    typealias Characters = [Character]
    typealias CharactersPaged = Paged<Characters>
    @discardableResult
    func characters(start: Cursor, batchSize: Int,
                    completion: @escaping (Result<CharactersPaged>) -> Void) -> Cancellable {
        
        guard batchSize > 0 else {
            preconditionFailure("Batch size must always be greater then zero")
        }

        return apollo
            .fetch(query: CharacterListQuery(after: start, first: batchSize),
                   cachePolicy: .returnCacheDataElseFetch,
                   queue: DispatchQueue.global(qos: .background)) { (gqlResult, error) in

                    let response: Result<CharactersPaged>
                    defer {
                        completion(response)
                    }

                    if let error = error {
                        response = .failure(NetworkError(error))
                        return
                    }

                    guard let charactersData = gqlResult?.data?.allPeople,
                        let totalCount = charactersData.totalCount,
                        let cursor = charactersData.pageInfo.endCursor,
                        let characters = charactersData.people else {

                            response = .failure(NetworkError(NetworkError.noData))
                            return
                    }

                    let result = CharactersPaged(totalCount: totalCount,
                                                 hasNext: charactersData.pageInfo.hasNextPage,
                                                 cursor: cursor,
                                                 characters: characters.compactMap({$0}))

                    response = .success(result)
        }
    }

    typealias Films = [CharacterFilmsQuery.Data.Person.FilmConnection.Film]
    @discardableResult
    func films(characterId: GraphQLID,
               completion: @escaping (Result<Films>) -> Void) -> Cancellable {

        return apollo
            .fetch(query: CharacterFilmsQuery(personId: characterId),
                   cachePolicy: .returnCacheDataElseFetch,
                   queue: DispatchQueue.global(qos: .background)) { (gqlResult, error) in

                    let response: Result<Films>
                    defer {
                        completion(response)
                    }

                    if let error = error {
                        response = .failure(NetworkError(error))
                        return
                    }

                    guard let films = gqlResult?.data?.person?.filmConnection?.films else {
                        response = .failure(NetworkError.noData)
                        return
                    }

                    response = .success(films.compactMap({$0}))
        }
    }
}
