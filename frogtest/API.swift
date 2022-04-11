//
//  API.swift
//  frogtest
//
//  Created by Alfredo Tochon on 4/8/22.
//

import Foundation

import Alamofire


// MARK: - API class will help to define the APIs in the remote networking when calling from the server
public class API {
    
    public let path: String
    public let method: HTTPMethod
    public let headerParamaters: HTTPHeaders
    public let queryParameters: [String: Any]
    public let bodyParamaters: [String: Any]
    public let bodyEncoding: ParameterEncoding
   
    init(path: String,
         method: HTTPMethod,
         headerParamaters: HTTPHeaders = [:],
         queryParameters: [String: Any] = [:],
         bodyParamatersEncodable: Encodable? = nil,
         bodyParamaters: [String: Any] = [:],
         bodyEncoding: ParameterEncoding = URLEncoding.default) {
        self.path = path
        self.method = method
        self.headerParamaters = headerParamaters
        self.queryParameters = queryParameters
        self.bodyParamaters = bodyParamaters
        self.bodyEncoding = bodyEncoding
   
    }
}
