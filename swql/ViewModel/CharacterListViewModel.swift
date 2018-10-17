//
//  CharacterListViewModel.swift
//  swql
//
//  Created by Aleksandar Mihailovski on 2018-10-16.
//  Copyright © 2018 Aleksandar Mihailovski. All rights reserved.
//

import Foundation
import Apollo

final class CharacterListViewModel: ViewModel {
    typealias CharacterListError = NetworkError
    
    private let characterClient: CharacterClient
    private var characterRequest: Cancellable?
    private var fetchCursor: NetworkClient.Cursor = ""
    private var batchSize = Int(15)
    private var totalCount = Int(0)
    private var hasNext = true
    private(set) var characters = CharacterClient.Characters()  {
        didSet {
            DispatchQueue.main.async {
                self.delegate?.didChange(self)
            }
        }
    }
    weak var delegate: ViewModelDelegate?

    init(characterClient: CharacterClient = CharacterClient()) {
        self.characterClient = characterClient
        fetchCharacters()
    }

    deinit {
        characterRequest?.cancel()
    }

    func fetchNext() {
        guard hasNext else {
            return
        }

        fetchCharacters()
    }

    private func fetchCharacters() {
        characterRequest?.cancel()
        characterRequest = characterClient.characters(start: fetchCursor,
                                                      batchSize: batchSize) { [weak self] (result) in
            guard let self = self else {
                return
            }

            switch result {
            case .failure(let error):
                self.onError(error)
            case .success(let charactersPaged):
                self.onSuccess(charactersPaged)
            }
        }
    }

    private func onError(_ error: CharacterListError) {
        delegate?.didFail(self, with: error)
    }

    private func onSuccess(_ charactersPaged: CharacterClient.CharactersPaged) {
        fetchCursor = charactersPaged.cursor
        totalCount = charactersPaged.totalCount
        hasNext = charactersPaged.hasNext
        characters.append(contentsOf: charactersPaged.characters)
    }
}
