//
//  CharacterTableViewCell.swift
//  swql
//
//  Created by Aleksandar Mihailovski on 2018-10-17.
//  Copyright © 2018 Aleksandar Mihailovski. All rights reserved.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {

    func configure(with character: CharacterClient.Character) {
        textLabel?.text = character.name ?? "No name available"
        detailTextLabel?.text =
            "From " + (character.homeworld?.name ?? "unknown origin")
            + ", "
            + "height: \((character.height ?? -1))" 
    }

    class var reuseIdentifier: String {
        return String(describing: self)
    }

}
