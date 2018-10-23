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
        tableView?.register(LoadingTableViewCell.self,
                            forCellReuseIdentifier: LoadingTableViewCell.reuseIdentifier)

        configureAppearance()
    }

    private func configureAppearance() {
        title = "All Films"
    }

}

extension FilmListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.filmList.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let film = viewModel?.filmList[indexPath.row] else {
            fatalError("No films for indexPath = \(indexPath)")
        }

        switch film {
        case .placeholder:
            let cell = tableView.dequeueReusableCell(withIdentifier: LoadingTableViewCell.reuseIdentifier,
                                                     for: indexPath) as! LoadingTableViewCell
            return cell
        case .value(let filmData):
            let cell = tableView.dequeueReusableCell(withIdentifier: FilmTableViewCell.reuseIdentifier,
                                                     for: indexPath) as! FilmTableViewCell
            cell.configure(with: filmData)
            return cell
        }
    }
}

extension FilmListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

        guard let film = viewModel?.filmList[indexPath.row],
            case DataType.value(let filmData) = film else {

                assertionFailure("Missing film at indexPath = \(indexPath)")
                return
        }

        let controller = ViewControllerFactory.create(for: .filmDetails(.id(filmData.id)))
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

