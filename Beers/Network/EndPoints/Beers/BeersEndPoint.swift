//
//  BeersEndPoint.swift
//  PagSeguro
//
//  Created by João Pedro on 21/01/21.
//

import Alamofire
import Foundation

public enum BeersEndPoint {
    case fetchBeers(parameters: FetchBeersParameters)
}

extension BeersEndPoint: EndPointType {

    public var service: NetworkService {
        return .beers
    }

    public var path: String {
        switch self {
        case .fetchBeers:
            return ""
        }
    }

    public var httpMethod: HTTPMethod {
        switch self {
        case .fetchBeers:
            return .get
        }
    }

    public var headers: HTTPHeaders? {
        return nil
    }

    public var parameters: Parameters? {
        switch self {
        case .fetchBeers(let parameters):
            return parameters.dictionary
        }
    }

    public var encoding: ParameterEncoding {
        URLEncoding.default
    }

    public var name: String {
        return String(describing: self)
    }
}
