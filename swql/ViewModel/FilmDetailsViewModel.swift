//
//  FilmDetailsViewModel.swift
//  swql
//
//  Created by Aleksandar Mihailovski on 2018-10-16.
//  Copyright © 2018 Aleksandar Mihailovski. All rights reserved.
//

import Foundation
import Apollo

class FilmDetailsViewModel: ViewModel {
    typealias FilmDetailsError = NetworkError

    struct FilmDetail {
        enum ActionType {
            case species
            case characters
        }
        enum FilmDetailType {
            case info
            case action(ActionType)
        }
        let type: FilmDetailType
        let title: String
        let value: String
    }

    private let filmClient: FilmClient
    private var filmRequest: Cancellable?
    private var film: FilmClient.Film {
        didSet {
            DispatchQueue.main.async {
                self.delegate?.didChange(self)
            }
        }
    }
    weak var delegate: ViewModelDelegate?

    var title: String {
        return film.title ?? "Coming Soon"
    }
    var openingCrawl: String {
        return film.openingCrawl ?? "\n\nComing Soon\n\nPlease Wait\n\n"
    }
    var items: [DataType<FilmDetail>] {
        var director: DataType<FilmDetail> = DataType.placeholder
        var releaseDate: DataType<FilmDetail> = DataType.placeholder
        var episodeId: DataType<FilmDetail> = DataType.placeholder
        let characters = DataType.value(FilmDetail(type: .action(.characters),
                                                   title: "Characters",
                                                   value: film.id))

        if let filmDirector = film.director {
            director = DataType.value(FilmDetail(type: .info,
                                                 title: "Director:",
                                                 value: filmDirector))
        }

        if let filmReleaseDate = film.releaseDate {
            releaseDate = DataType.value(FilmDetail(type: .info,
                                                    title: "Release Date:",
                                                    value: filmReleaseDate))
        }

        if let filmEpisodeId = film.episodeId {
            episodeId = DataType.value(FilmDetail(type: .info,
                                                  title: "Episode:",
                                                  value: String(filmEpisodeId)))
        }

        return [director, releaseDate, episodeId, characters]
    }

    init(film: FilmClient.Film, filmClient: FilmClient = FilmClient()) {
        self.film = film
        self.filmClient = filmClient
        fetchFilm()
    }

    deinit {
        filmRequest?.cancel()
    }

    private func fetchFilm() {
        filmRequest?.cancel()
        filmRequest = filmClient.film(filmId: film.id) { [weak self] (result) in
            guard let self = self else {
                return
            }

            switch result {
            case .failure(let error):
                self.onError(error)
            case .success(let film):
                self.onSuccess(film)
            }
        }
    }

    private func onError(_ error: FilmDetailsError) {
        delegate?.didFail(self, with: error)
    }

    private func onSuccess(_ film: FilmClient.Film) {
        self.film = film
    }
}
