//
//  ViewControllerFactory.swift
//  swql
//
//  Created by Aleksandar Mihailovski on 2018-10-17.
//  Copyright © 2018 Aleksandar Mihailovski. All rights reserved.
//

import UIKit
import Apollo

final class ViewControllerFactory {

    enum ParameterType {
        case id(GraphQLID)
        case instance(GraphQLSelectionSet)
    }

    enum ControllerType {
        case filmList
        case filmDetails(ParameterType)
        case characterList
    }

    static func create(for type: ControllerType) -> UIViewController {
        switch type {
        case .filmList:
            return createFilmListViewController()
        case .filmDetails(.id(let filmId)):
            return createFilmDetailsViewController(filmId: filmId)
        case .filmDetails(.instance(let film)):
            return createFilmDetailsViewController(film: film as! FilmClient.Film)
        case .characterList:
            return createCharacterListViewController()
        }
    }

    private static func createFilmListViewController() -> FilmListViewController {
        let controller = FilmListViewController.instantiate()
        let viewModel = FilmListViewModel()
        viewModel.delegate = controller
        controller.viewModel = viewModel
        return controller
    }

    private static func createFilmDetailsViewController(film: FilmClient.Film) -> FilmDetailsViewController {
        let controller = FilmDetailsViewController.instantiate()
        let viewModel = FilmDetailsViewModel(film: film)
        viewModel.delegate = controller
        controller.viewModel = viewModel
        return controller
    }

    private static func createFilmDetailsViewController(filmId: GraphQLID) -> FilmDetailsViewController {
        return createFilmDetailsViewController(film: FilmClient.Film(id: filmId))
    }

//    private static func createCharacterListViewController() -> CharacterListViewController {
//        let controller = CharacterListViewController.instantiate()
//        let viewModel = CharacterListViewModel()
//        viewModel.delegate = controller
//        controller.viewModel = viewModel
//        return controller
//    }
}
