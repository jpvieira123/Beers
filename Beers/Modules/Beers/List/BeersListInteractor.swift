//
//  BeersListInteractor.swift
//  PagSeguro
//
//  Created by João Pedro on 21/01/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol BeersListBusinessLogic {
    func fetchBeerList(request: BeersList.FetchBeers.Request)
    func selectBeer(request: BeersList.SelectBeers.Request)
}

protocol BeersListDataStore {
    var allItems: [FetchBeersResponse] { get set }
    var selectedItem: FetchBeersResponse? { get set }
}

final class BeersListInteractor: BeersListBusinessLogic, BeersListDataStore {

    // MARK: - Var's
    var presenter: BeersListPresentationLogic?
    var worker = BeersListWorker()
    var allItems: [FetchBeersResponse] = []
    var selectedItem: FetchBeersResponse?
    
    // MARK: - Func's
    func fetchBeerList(request: BeersList.FetchBeers.Request) {
        worker.fetchBeers(page: request.page)
        .done { [weak self] response in
            response.forEach { item in
                if let oldIndex = self?.allItems.firstIndex(of: item) {
                    self?.allItems.remove(at: oldIndex)
                    self?.allItems.insert(item, at: oldIndex)
                } else {
                    self?.allItems.append(item)
                }
            }
            let response = BeersList.FetchBeers.Response.Success(data: response)
            self?.presenter?.presentSuccessBeersList(response: response)
        }.catch { [weak self] error in
            let response = BeersList.FetchBeers.Response.Failure(error: error)
            self?.presenter?.presentFailureBeersList(response: response)
        }
    }

    func selectBeer(request: BeersList.SelectBeers.Request) {
        self.selectedItem = allItems.first(where: { $0.id == request.beerId })
        let response = BeersList.SelectBeers.Response.Success()
        presenter?.presentSuccessSelectBeers(response: response)
    }
}
