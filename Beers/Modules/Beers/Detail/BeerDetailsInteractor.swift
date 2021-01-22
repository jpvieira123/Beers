//
//  BeerDetailsInteractor.swift
//  PagSeguro
//
//  Created by João Pedro on 22/01/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol BeerDetailsBusinessLogic {
    func fetchBeerDetail(request: BeerDetails.FetchBeer.Request)
}

protocol BeerDetailsDataStore {
    var selectedItem: FetchBeersResponse? { get set }
}

final class BeerDetailsInteractor: BeerDetailsBusinessLogic, BeerDetailsDataStore {

    // MARK: - Var's
    var presenter: BeerDetailsPresentationLogic?
    var worker = BeerDetailsWorker()
    var selectedItem: FetchBeersResponse?

    // MARK: - Func's
    func fetchBeerDetail(request: BeerDetails.FetchBeer.Request) {
        guard let item = self.selectedItem else {
            let error = BeerDetails.BeerError.beerNotFound
            let response = BeerDetails.FetchBeer.Response.Failure(error: error)
            presenter?.presentFailureFetchBeer(response: response)
            return
        }

        let response = BeerDetails.FetchBeer.Response.Success(beer: item)
        presenter?.presentSuccessFetchBeer(response: response)
    }
}
