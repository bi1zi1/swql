//
//  FilmDetailsViewController.swift
//  swql
//
//  Created by Aleksandar Mihailovski on 2018-10-16.
//  Copyright © 2018 Aleksandar Mihailovski. All rights reserved.
//

import UIKit

class FilmDetailsViewController: UIViewController, ViewController {

    @IBOutlet weak var tableView: UITableView?
    @IBOutlet weak var openingCrawlLabel: UILabel?
    var viewModel: FilmDetailsViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView?.dataSource = self
        tableView?.delegate = self

        configureAppearance()
    }

    private func configureAppearance() {
        title = viewModel?.title
        openingCrawlLabel?.text = viewModel?.openingCrawl
    }

}

extension FilmDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.items.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let filmDetail = viewModel?.items[indexPath.row] else {
            fatalError("No item for indexPath = \(indexPath)")
        }

        let cell: UITableViewCell
        switch filmDetail.type {
        case .info:
            cell = tableView.dequeueReusableCell(withIdentifier: FilmDetailItemTableViewCell.reuseIdentifier,
                                                 for: indexPath)
            if let cell = cell as? FilmDetailItemTableViewCell {
                cell.configure(with: filmDetail)
            }
        case .action:
            cell = tableView.dequeueReusableCell(withIdentifier: FilmDetailActionTableViewCell.reuseIdentifier,
                                                 for: indexPath)
            if let cell = cell as? FilmDetailActionTableViewCell {
                cell.configure(with: filmDetail)
            }
        }

        return cell
    }
}

extension FilmDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

        guard let filmDetail = viewModel?.items[indexPath.row] else {
            assertionFailure("No item for indexPath = \(indexPath)")
            return
        }

        if case .action(.characters) = filmDetail.type {
            let controller = ViewControllerFactory.create(for: .characterList)
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}

extension FilmDetailsViewController: ViewModelDelegate {
    func didChange(_ viewModel: ViewModel) {
        tableView?.reloadData()
        configureAppearance()
    }

    func didFail(_ viewModel: ViewModel, with error: Error) {
        // TODO: Implement
    }
}

extension FilmDetailsViewController: StoryboardPresentable {
    static let storyboardName = "Main"
    static let viewControllerID = "FilmDetailsViewController"
}
