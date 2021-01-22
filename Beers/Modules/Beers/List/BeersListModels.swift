//
//  BeersListModels.swift
//  PagSeguro
//
//  Created by João Pedro on 21/01/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum BeersList {
    
    struct Beers: Equatable {
        let id: Int
        let name: String
        let imageURL: String
        let abv: Double

        public static func == (lhs: Self, rhs: Self) -> Bool {
            lhs.id == rhs.id
        }
    }
    
    enum FetchBeers {
        struct Request {
            let page: Int
        }
        enum Response {
            struct Success {
                let data: [FetchBeersResponse]
            }
            struct Failure {
                let error: Error
            }
        }
        enum ViewModel {
            struct Success {
                let hasNextPage: Bool
                let data: [Beers]
            }
            struct Failure {
                let error: Error
            }
        }
    }

    enum SelectBeers {
        struct Request {
            let beerId: Int
        }
        enum Response {
            struct Success { }
            struct Failure {
                let error: Error
            }
        }
        enum ViewModel {
            struct Success { }
            struct Failure {
                let error: Error
            }
        }
    }
}
