//
//  FilmClient.swift
//  swql
//
//  Created by Aleksandar Mihailovski on 2018-10-14.
//  Copyright © 2018 Aleksandar Mihailovski. All rights reserved.
//

import Foundation
import Apollo

class FilmClient: NetworkClient {

    typealias Films = [FilmListQuery.Data.AllFilm.Film]
    func films(completion: @escaping (Result<Films>) -> Void) {
        apollo.fetch(query: FilmListQuery(),
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

                        guard let films = gqlResult?.data?.allFilms?.films else {
                            response = .failure(NetworkError.noData)
                            return
                        }

                         response = .success(films.compactMap({$0}))
        }
    }

    typealias Film = FilmIntroQuery.Data.Film
    func film(filmId: GraphQLID, completion: @escaping (Result<Film>) -> Void) {
        apollo.fetch(query: FilmIntroQuery(filmId: filmId),
                     cachePolicy: .returnCacheDataElseFetch,
                     queue: DispatchQueue.global(qos: .background)) { (gqlResult, error) in

                        let response: Result<Film>
                        defer {
                            completion(response)
                        }

                        if let error = error {
                            response = .failure(NetworkError(error))
                            return
                        }

                        guard let film = gqlResult?.data?.film else {
                            response = .failure(NetworkError.noData)
                            return
                        }

                        response = .success(film)
        }
    }

    typealias Species = [FilmSpeciesQuery.Data.Film.SpeciesConnection.Species]
    func species(filmId: GraphQLID, completion: @escaping (Result<Species>) -> Void) {
        apollo.fetch(query: FilmSpeciesQuery(filmId: filmId),
                     cachePolicy: .returnCacheDataElseFetch,
                     queue: DispatchQueue.global(qos: .background)) { (gqlResult, error) in

                        let response: Result<Species>
                        defer {
                            completion(response)
                        }

                        if let error = error {
                            response = .failure(NetworkError(error))
                            return
                        }

                        guard let species = gqlResult?.data?.film?.speciesConnection?.species else {
                            response = .failure(NetworkError.noData)
                            return
                        }

                        response = .success(species.compactMap({$0}))
        }
    }

    typealias Characters = [FilmCharactersQuery.Data.Film.CharacterConnection.Character]
    func characters(filmId: GraphQLID, completion: @escaping (Result<Characters>) -> Void) {
        apollo.fetch(query: FilmCharactersQuery(filmId: filmId),
                     cachePolicy: .returnCacheDataElseFetch,
                     queue: DispatchQueue.global(qos: .background)) { (gqlResult, error) in

                        let response: Result<Characters>
                        defer {
                            completion(response)
                        }

                        if let error = error {
                            response = .failure(NetworkError(error))
                            return
                        }

                        guard let characters = gqlResult?.data?.film?.characterConnection?.characters else {
                            response = .failure(NetworkError.noData)
                            return
                        }

                        response = .success(characters.compactMap({$0}))
        }
    }
}
