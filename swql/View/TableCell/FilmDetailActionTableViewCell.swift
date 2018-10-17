//
//  FilmDetailActionTableViewCell.swift
//  swql
//
//  Created by Aleksandar Mihailovski on 2018-10-16.
//  Copyright © 2018 Aleksandar Mihailovski. All rights reserved.
//

import UIKit

final class FilmDetailActionTableViewCell: UITableViewCell {

    func configure(with filmItem: FilmDetailsViewModel.FilmDetail) {
        textLabel?.text = filmItem.title
    }

    class var reuseIdentifier: String {
        return String(describing: self)
    }

}
