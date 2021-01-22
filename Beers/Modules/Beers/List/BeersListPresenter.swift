//
//  BeersListPresenter.swift
//  PagSeguro
//
//  Created by João Pedro on 21/01/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol BeersListPresentationLogic {
    func presentSuccessBeersList(response: BeersList.FetchBeers.Response.Success)
    func presentFailureBeersList(response: BeersList.FetchBeers.Response.Failure)

    func presentSuccessSelectBeers(response: BeersList.SelectBeers.Response.Success)
    func presentFailureSelectBeers(response: BeersList.SelectBeers.Response.Failure)
}

final class BeersListPresenter: BeersListPresentationLogic {

    // MARK: - Var's
    weak var viewController: BeersListDisplayLogic?

    // MARK: - Func's
    func presentSuccessBeersList(response: BeersList.FetchBeers.Response.Success) {
        let viewModel = BeersList.FetchBeers.ViewModel.Success(
            hasNextPage: !response.data.isEmpty,
            data: response.data.map {
                BeersList.Beers(
                    id: $0.id,
                    name: $0.name,
                    imageURL: $0.imageURL,
                    abv: $0.abv)
            })
        viewController?.displaySuccessFetchBeers(viewModel: viewModel)
    }

    func presentFailureBeersList(response: BeersList.FetchBeers.Response.Failure) {
        let viewModel = BeersList.FetchBeers.ViewModel.Failure(error: response.error)
        viewController?.displayFailureFetchBeers(viewModel: viewModel)
    }

    func presentSuccessSelectBeers(response: BeersList.SelectBeers.Response.Success) {
        let viewModel = BeersList.SelectBeers.ViewModel.Success()
        viewController?.displaySuccessSelectBeers(viewModel: viewModel)
    }

    func presentFailureSelectBeers(response: BeersList.SelectBeers.Response.Failure) {
        let viewModel = BeersList.SelectBeers.ViewModel.Failure(error: response.error)
        viewController?.displayFailureSelectBeers(viewModel: viewModel)
    }
}
