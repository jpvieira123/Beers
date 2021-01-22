//
//  BeerDetailsModels.swift
//  PagSeguro
//
//  Created by João Pedro on 22/01/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum BeerDetails {
    enum BeerError: DefaultError {
        case beerNotFound

        var errorType: ErrorType { .inner }
        var customErrorMessage: ErrorMessageString { ErrorMessages.genericError }
    }

    struct Beer: Equatable {
        let id: Int
        let name: String
        let description: String
        let tagline: String
        let imageURL: String
        let abv: Double
        let ibu: Double?

        public static func == (lhs: Self, rhs: Self) -> Bool {
            lhs.id == rhs.id
        }
    }
    
    enum FetchBeer {
        struct Request { }
        enum Response {
            struct Success {
                let beer: FetchBeersResponse
            }
            struct Failure {
                let error: Error
            }
        }
        enum ViewModel {
            struct Success {
                let beer: Beer
            }
            struct Failure {
                let error: Error
            }
        }
    }
}
