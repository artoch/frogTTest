//
//  BaseNetworking.swift
//  frogtest
//
//  Created by Alfredo Tochon on 4/8/22.
//

import Foundation
import Alamofire
import Combine

// MARK: - Generic base networking class that will send request to the server and parse the response
class BaseNetworking {
    
    // MARK: Shared Instance
    public static let shared: BaseNetworking = BaseNetworking()
    
    
    ///To handle API calls and return the response
    func request<T: Codable>(_ t: T.Type,endPoint: API, completion: @escaping (_ result: T?, _ error: ErrorResponse?) -> Void)  {
        
        let url = buildRequestURL(endPoint: endPoint)
        
        if(url != nil) {
            ///herer we will call our API
            ///if it's sucess then return the object after parsing
            ///if it's failure then return error object
            AF.request(url!,
                       method: endPoint.method,
                       parameters: endPoint.bodyParamaters,
                       encoding: endPoint.bodyEncoding,
                       headers: endPoint.headerParamaters
            ).validate().responseDecodable(of: T.self)
            { (response) in
                switch response.result {
                case .success(_):
                    guard let response = response.value else
                    {
                        completion(nil, ErrorResponse(message: "parsing_error".localized))
                        return
                    }
                    print(response)
                    completion(response, nil)
               
                case .failure(_):
                    if let responseData = response.data {
                        if let errorApi = try? JSONDecoder().decode(BaseErrorApi.self, from: responseData){
                            completion(nil, ErrorResponse(message: errorApi.toErrorResponse()))
                        }else{
                            completion(nil, ErrorResponse(message: "server_error".localized))
                        }
                    }else{
                        completion(nil, ErrorResponse(message: "server_error".localized))
                    }

                }
            }
            
        }else {
            completion(nil, ErrorResponse(message: "url_error".localized))
        }


    }
    
    
    /// in order to handle the get request with any query parameters
    private func buildRequestURL(endPoint: API) -> URL? {
        let url = URL(string: endPoint.path)

        return url
    }
    
}
