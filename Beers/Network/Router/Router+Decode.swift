//
//  Router+Decode.swift
//  PagSeguro
//
//  Created by João Pedro on 21/01/21.
//

import Alamofire
import PromiseKit
import Foundation

extension Router {

    func parseValue<T: Codable>(data: Data?, responseType: T.Type) throws -> T? {
        //do..catch is for debug proposals
        do {
            let dataToDecode = data ?? Data("{}".utf8)
            return try JSONDecoder().decode(responseType, from: dataToDecode)
        } catch {
            throw error
        }
    }

    func handleServerResponse<T: Codable>(
        route: EndPoint,
        responseType: T.Type,
        seal: Resolver<T>,
        response: AFDataResponse<Any>,
        request: DataRequest? = nil
    ) {
        guard let statusCode = response.response?.statusCode else {
            seal.reject(HTTPError(cause: .noResponse, endpoint: route, status: nil))
            return
        }

        switch statusCode {
        case 200...204:
            if let decodifiedResponse = try? self.parseValue(data: response.data,
                                                             responseType: responseType) {
                    seal.fulfill(decodifiedResponse)
            } else {
                seal.reject(HTTPError(cause: .unableToDecode, endpoint: route, status: statusCode))
            }
        case 400:
            seal.reject(HTTPError(
                cause: .badRequest(headers: response.response?.allHeaderFields),
                endpoint: route,
                status: statusCode
            ))
        case 401:
            seal.reject(HTTPError(cause: .notAuthorized, endpoint: route, status: statusCode))
        case 403:
            seal.reject(HTTPError(cause: .forbidden, endpoint: route, status: statusCode))
        case 404:
            seal.reject(HTTPError(cause: .notFound, endpoint: route, status: statusCode))
        case 408:
            seal.reject(HTTPError(cause: .timeout, endpoint: route, status: statusCode))
        case 409:
            seal.reject(HTTPError(cause: .conflict, endpoint: route, status: statusCode))
        case 410:
            seal.reject(HTTPError(cause: .gone, endpoint: route, status: statusCode))
        case 500...599:
            seal.reject(HTTPError(cause: .serverError, endpoint: route, status: statusCode))
        default:
            seal.reject(HTTPError(cause: .failed, endpoint: route, status: statusCode))
        }
    }
}
