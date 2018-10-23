//
//  CharacterListViewController.swift
//  swql
//
//  Created by Aleksandar Mihailovski on 2018-10-07.
//  Copyright © 2018 Aleksandar Mihailovski. All rights reserved.
//

import UIKit

class CharacterListViewController: UIViewController, ViewController {

    @IBOutlet weak var tableView: UITableView?
    var viewModel: CharacterListViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView?.dataSource = self
        tableView?.delegate = self

        configureAppearance()
    }

    private func configureAppearance() {
        title = "All Characters"
    }

}

extension CharacterListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.characters.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let character = viewModel?.characters[indexPath.row] else {
            fatalError("No character for indexPath = \(indexPath)")
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.reuseIdentifier,
                                                 for: indexPath) as! CharacterTableViewCell
        cell.configure(with: character)
        return cell
    }
}

extension CharacterListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }

    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        if scrollView.isBouncingBottom {
            viewModel?.fetchNext()
        }
    }
}

extension CharacterListViewController: ViewModelDelegate {
    func didChange(_ viewModel: ViewModel) {
        tableView?.reloadData()
    }

    func didFail(_ viewModel: ViewModel, with error: Error) {
        // TODO: Implement
    }
}

extension CharacterListViewController: StoryboardPresentable {
    static let storyboardName = "Main"
    static let viewControllerID = "CharacterListViewController"
}

