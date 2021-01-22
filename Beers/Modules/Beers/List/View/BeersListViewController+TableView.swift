//
//  BeersListViewController+TableView.swift
//  PagSeguro
//
//  Created by João Pedro on 21/01/21.
//

import UIKit

// MARK: - DATA SOURCE
extension BeersListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeue(BeerTableViewCell.self, for: indexPath) <-< {
            $0.item = items[indexPath.row]
        }
    }
}

// MARK: - DELEGATE
extension BeersListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let request = BeersList.SelectBeers.Request(beerId: items[indexPath.row].id)
        interactor?.selectBeer(request: request)
    }
}

// MARK: - INFINITE LOADABLE
extension BeersListViewController: InfiniteTableLoadable {
    func loadingCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeue(LoadingTableViewCell.self, for: indexPath) <-< {
            $0.backgroundColor = .clear
        }
    }

    func retryCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeue(GenericRetryTableViewCell.self, for: indexPath)
    }

    func emptyCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeue(BeerEmptyTableViewCell.self, for: indexPath)
    }
}
