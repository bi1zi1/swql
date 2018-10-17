//
//  FilmTableViewCell.swift
//  swql
//
//  Created by Aleksandar Mihailovski on 2018-10-16.
//  Copyright © 2018 Aleksandar Mihailovski. All rights reserved.
//

import UIKit
import Apollo

final class FilmTableViewCell: UITableViewCell {
    private var film: FilmClient.ListItemFilm?
    var filmId: GraphQLID? {
        return film?.id
    }

    func configure(with film: FilmClient.ListItemFilm) {
        self.film = film

        textLabel?.text = film.title ?? "No title available"
        detailTextLabel?.text =
            (film.director ?? "Director?!?")
            + " - "
            + (film.releaseDate ?? "Released?!?")
    }

    class var reuseIdentifier: String {
        return String(describing: self)
    }
}
