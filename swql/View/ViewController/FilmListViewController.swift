//
//  FilmListViewController.swift
//  swql
//
//  Created by Aleksandar Mihailovski on 2018-10-07.
//  Copyright © 2018 Aleksandar Mihailovski. All rights reserved.
//

import UIKit

class FilmListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView?
    var viewModel: FilmListViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView?.dataSource = self
        tableView?.delegate = self

        configureApperance()
    }

    private func configureApperance() {
        title = "All Films"
    }

}

extension FilmListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.films.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let film = viewModel?.films[indexPath.row] else {
            fatalError("No films for indexPath = \(indexPath)")
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: FilmTableViewCell.reuseIdentifier,
                                                 for: indexPath) as! FilmTableViewCell
        cell.configure(with: film)
        return cell
    }
}

extension FilmListViewController: UITableViewDelegate {
    // TODO: Implement
}

extension FilmListViewController: ViewModelDelegate {
    func didChange(_ viewModel: ViewModel) {
        tableView?.reloadData()
    }

    func didFail(_ viewModel: ViewModel, with error: Error) {
        // TODO: Implement
    }
}

extension FilmListViewController: StoryboardPresentable {
    static let storyboardName = "Main"
    static let viewControllerID = "FilmListViewController"
}

