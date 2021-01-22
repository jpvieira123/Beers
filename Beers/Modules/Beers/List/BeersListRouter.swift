//
//  BeersListRouter.swift
//  PagSeguro
//
//  Created by João Pedro on 21/01/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

@objc protocol BeersListRoutingLogic {
    func routeToBeerDetails()
}

protocol BeersListDataPassing {
    var dataStore: BeersListDataStore? { get }
}

final class BeersListRouter: NSObject, BeersListRoutingLogic, BeersListDataPassing {

    // MARK: - Var's
    weak var viewController: BeersListViewController?
    var dataStore: BeersListDataStore?

    // MARK: - Func's
    func routeToBeerDetails() {
        let beerDetailsVC = BeerDetailsViewController()
        var destDataStore = beerDetailsVC.router?.dataStore
        destDataStore?.selectedItem = dataStore?.selectedItem
        viewController?.navigationController?.pushViewController(beerDetailsVC, animated: true)
    }
}
