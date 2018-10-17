//
//  FilmDetailItemTableViewCell.swift
//  swql
//
//  Created by Aleksandar Mihailovski on 2018-10-16.
//  Copyright © 2018 Aleksandar Mihailovski. All rights reserved.
//

import UIKit

final class FilmDetailItemTableViewCell: UITableViewCell {

    func configure(with filmItem: FilmDetailsViewModel.FilmDetail) {
        textLabel?.text = filmItem.title
        detailTextLabel?.text = filmItem.value
    }

    class var reuseIdentifier: String {
        return String(describing: self)
    }

}
