//
//  FilmListViewModel.swift
//  swql
//
//  Created by Aleksandar Mihailovski on 2018-10-16.
//  Copyright © 2018 Aleksandar Mihailovski. All rights reserved.
//

import Foundation
import Apollo

final class FilmListViewModel: ViewModel {
    typealias FilmListError = NetworkError
    typealias DataItem = DataType<FilmClient.ListItemFilm>
    
    private let filmClient: FilmClient
    private var filmsRequest: Cancellable?
    private var films = FilmClient.Films()  {
        didSet {
            DispatchQueue.main.async {
                self.delegate?.didChange(self)
            }
        }
    }
    weak var delegate: ViewModelDelegate?
    private var loadingList: [DataItem] {
        return Array(repeating: DataItem.placeholder, count: 20)
    }
    var filmList: [DataItem] {
        switch films.count {
        case ..<1:
            return loadingList
        default:
            return films.compactMap { film in
                DataType.value(film)
            }
        }
    }

    init(filmClient: FilmClient = FilmClient()) {
        self.filmClient = filmClient
        fetchFilms()
    }

    deinit {
        filmsRequest?.cancel()
    }

    private func fetchFilms() {
        filmsRequest?.cancel()
        filmsRequest = filmClient.films { [weak self] (result) in
            guard let self = self else {
                return
            }

            switch result {
            case .failure(let error):
                self.onError(error)
            case .success(let films):
                self.onSuccess(films)
            }
        }
    }

    private func onError(_ error: FilmListError) {
        delegate?.didFail(self, with: error)
    }

    private func onSuccess(_ films: FilmClient.Films) {
        self.films = films
    }
}
