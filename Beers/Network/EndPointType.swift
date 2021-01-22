//
//  EndPointType.swift
//  PagSeguro
//
//  Created by João Pedro on 21/01/21.
//

import Foundation
import Alamofire

public typealias RequestParameters = Encodable
public typealias Parameters = [String: Any]

public protocol EndPointType {
    var service: NetworkService { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var encoding: ParameterEncoding { get }
    var name: String { get }
    var parameters: Parameters? { get }
}

extension EndPointType {
    public var fullPath: String {
        var path = self.baseURL.appendingPathComponent(self.path).absoluteString

        //Add query params to cache path
        if let parameters = self.parameters,
            !parameters.isEmpty,
            var urlComps = URLComponents(string: path),
            let enconding = self.encoding as? URLEncoding {

            let percentEncodedQuery = (urlComps.percentEncodedQuery.map { $0 + "&" } ?? "") + query(enconding, parameters)
            urlComps.percentEncodedQuery = percentEncodedQuery
            path = urlComps.url?.absoluteString ?? path
        }

        return path
    }

    private func query(_ enconding: URLEncoding, _ parameters: [String: Any]) -> String {
        var components: [(String, String)] = []

        for key in parameters.keys.sorted(by: <) {
            let value = parameters[key]!
            components += enconding.queryComponents(fromKey: key, value: value)
        }
        return components.map { "\($0)=\($1)" }.joined(separator: "&")
    }
}

extension RequestParameters {
    var dictionary: [String: Any]? {
      guard let data = try? JSONEncoder().encode(self) else { return nil }
      return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments))
          .flatMap { $0 as? [String: Any] }
    }
}
