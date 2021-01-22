//
//  NetworkService.swift
//  PagSeguro
//
//  Created by João Pedro on 21/01/21.
//

import Foundation

public enum NetworkService {
    case beers

    var path: String {
        switch self {
        case .beers:
            return apiVersion + "beers"
        }
    }

    var apiVersion: String {
        switch self {
        case .beers:
            return "v2/"
        }
    }
}
