//
//  BeersListViewController+DisplayLogic.swift
//  PagSeguro
//
//  Created by João Pedro on 21/01/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol BeersListDisplayLogic: class {
    func displaySuccessFetchBeers(viewModel: BeersList.FetchBeers.ViewModel.Success)
    func displayFailureFetchBeers(viewModel: BeersList.FetchBeers.ViewModel.Failure)

    func displaySuccessSelectBeers(viewModel: BeersList.SelectBeers.ViewModel.Success)
    func displayFailureSelectBeers(viewModel: BeersList.SelectBeers.ViewModel.Failure)
}

extension BeersListViewController: BeersListDisplayLogic {
    func displaySuccessFetchBeers(viewModel: BeersList.FetchBeers.ViewModel.Success) {
        tableViewProxy.haveNextPage = viewModel.hasNextPage
        viewModel.data.forEach { item in
            if let oldIndex = items.firstIndex(of: item) {
                items.remove(at: oldIndex)
                items.insert(item, at: oldIndex)
            } else {
                items.append(item)
            }
        }

        tableViewProxy.currentState = items.isEmpty ? .empty : .none
    }

    func displayFailureFetchBeers(viewModel: BeersList.FetchBeers.ViewModel.Failure) {
        tableViewProxy.currentState = .retryError
    }

    func displaySuccessSelectBeers(viewModel: BeersList.SelectBeers.ViewModel.Success) {
        router?.routeToBeerDetails()
    }

    func displayFailureSelectBeers(viewModel: BeersList.SelectBeers.ViewModel.Failure) {
        debugPrint(viewModel.error)
    }
}
