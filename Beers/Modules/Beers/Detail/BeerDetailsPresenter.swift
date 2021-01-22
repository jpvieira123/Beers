//
//  BeerDetailsPresenter.swift
//  PagSeguro
//
//  Created by João Pedro on 22/01/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol BeerDetailsPresentationLogic {
    func presentSuccessFetchBeer(response: BeerDetails.FetchBeer.Response.Success)
    func presentFailureFetchBeer(response: BeerDetails.FetchBeer.Response.Failure)
}

final class BeerDetailsPresenter: BeerDetailsPresentationLogic {

    // MARK: - Var's
    weak var viewController: BeerDetailsDisplayLogic?

    // MARK: - Func's
    func presentSuccessFetchBeer(response: BeerDetails.FetchBeer.Response.Success) {
        let viewModel = BeerDetails.FetchBeer.ViewModel.Success(
            beer: BeerDetails.Beer(id: response.beer.id,
                                   name: response.beer.name,
                                   description: response.beer.description,
                                   tagline: response.beer.tagline,
                                   imageURL: response.beer.imageURL,
                                   abv: response.beer.abv,
                                   ibu: response.beer.ibu))

        viewController?.displaySuccessFetchBeer(viewModel: viewModel)
    }

    func presentFailureFetchBeer(response: BeerDetails.FetchBeer.Response.Failure) {
        let viewModel = BeerDetails.FetchBeer.ViewModel.Failure(error: response.error)
        viewController?.displayFailureFetchBeer(viewModel: viewModel)
    }
}
