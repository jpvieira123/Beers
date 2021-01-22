//
//  Router+Request.swift
//  PagSeguro
//
//  Created by João Pedro on 21/01/21.
//


import UIKit
import Alamofire
import PromiseKit

extension Router {
    public func log(request: URLRequest?) {
        debugPrint(" - - - - - - - - - - REQUEST - - - - - - - - - - ")
        debugPrint("URI: \(nullable: request?.httpMethod) \(nullable: request?.url?.absoluteString)")
        debugPrint("Headers: \(nullable: request?.allHTTPHeaderFields)")
        debugPrint("Body: \(nullable: request?.httpBody)")
        debugPrint(" - - - - - - - - - - END - - - - - - - - - - ")
    }

    public func request<T: Codable>(
        from route: EndPoint,
        responseType: T.Type
    ) -> Promise<T> {

        return Promise { seal in
            
            if !NetworkConnectivity.isConnectedToInternet {
                seal.reject(HTTPError(cause: .internetConectionFailed, endpoint: route, status: nil))
                return
            }
            
            var headers: [String: String] = route.sharedHeader
            if let headersRequest = route.headers {
                headers.update(other: headersRequest.dictionary)
            }

            let url = route.baseURL.appendingPathComponent(route.path)
            
            HTTPCookieStorage.shared.cookies?.forEach { HTTPCookieStorage.shared.deleteCookie($0) }
            URLCache.shared.removeAllCachedResponses()
            
            let request = manager.request(
                url,
                method: route.httpMethod,
                parameters: route.parameters,
                encoding: route.encoding,
                headers: HTTPHeaders(headers)
            )


            request.responseJSON { [weak self] data in
                self?.log(request: data.request)
                self?.handleServerResponse(route: route,
                                           responseType: responseType,
                                           seal: seal,
                                           response: data,
                                           request: request)
            }
        }
    }
}
