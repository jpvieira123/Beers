//
//  BeerDetailsRouter.swift
//  PagSeguro
//
//  Created by João Pedro on 22/01/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

@objc protocol BeerDetailsRoutingLogic {

}

protocol BeerDetailsDataPassing {
    var dataStore: BeerDetailsDataStore? { get }
}

final class BeerDetailsRouter: NSObject, BeerDetailsRoutingLogic, BeerDetailsDataPassing {

    // MARK: - Var's
    weak var viewController: BeerDetailsViewController?
    var dataStore: BeerDetailsDataStore?

    // MARK: - Func's

}
