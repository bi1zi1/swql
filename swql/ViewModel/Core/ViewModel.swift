//
//  ViewModel.swift
//  swql
//
//  Created by Aleksandar Mihailovski on 2018-10-16.
//  Copyright © 2018 Aleksandar Mihailovski. All rights reserved.
//

protocol ViewModel {}

protocol ViewModelDelegate: AnyObject {
    func didChange(_ viewModel: ViewModel)
    func didFail(_ viewModel: ViewModel, with error: Error)
}
