//
//  NetworkManager.swift
//  PagSeguro
//
//  Created by João Pedro on 21/01/21.
//

import Foundation
import PromiseKit

public struct NetworkManager {
    public let beers = Router<BeersEndPoint>()

    public init() { }
}
