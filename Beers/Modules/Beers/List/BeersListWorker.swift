//
//  BeersListWorker.swift
//  PagSeguro
//
//  Created by João Pedro on 21/01/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import PromiseKit

final class BeersListWorker {

    // MARK: - Var's
    lazy var network = NetworkManager()

    //MARK: - Func's
    func fetchBeers(page: Int) -> Promise<[FetchBeersResponse]> {
        let parameters = FetchBeersParameters(page: page)

        return network.beers.request(from: .fetchBeers(parameters: parameters),
                                     responseType: [FetchBeersResponse].self)
    }
}
