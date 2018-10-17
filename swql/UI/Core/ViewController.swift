//
//  ViewController.swift
//  swql
//
//  Created by Aleksandar Mihailovski on 2018-10-17.
//  Copyright © 2018 Aleksandar Mihailovski. All rights reserved.
//

import UIKit

protocol ViewController {
    associatedtype ViewModelT: ViewModel
    var viewModel: ViewModelT? { get set }
}
