//
//  FetchBeersParameters.swift
//  PagSeguro
//
//  Created by João Pedro on 21/01/21.
//

import Foundation

public struct FetchBeersParameters: RequestParameters {
    public let page: Int
    public let per_page: Int

    public init(page: Int, per_page: Int = 25) {
      self.page = page
      self.per_page = per_page
    }
}
