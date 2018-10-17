//
//  FilmListViewController.swift
//  swql
//
//  Created by Aleksandar Mihailovski on 2018-10-07.
//  Copyright © 2018 Aleksandar Mihailovski. All rights reserved.
//

import UIKit

class FilmListViewController: UIViewController, ViewController {

    @IBOutlet weak var tableView: UITableView?
    var viewModel: FilmListViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView?.dataSource = self
        tableView?.delegate = self

        configureAppearance()
    }

    private func configureAppearance() {
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

        guard let film = viewModel?.films[indexPath.row] else {
            assertionFailure("Missing film at indexPath = \(indexPath)")
            return
        }

        let controller = ViewControllerFactory.create(for: .filmDetails(.id(film.id)))
        navigationController?.pushViewController(controller, animated: true)
    }
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

