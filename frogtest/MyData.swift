//
//  MyData.swift
//  frogtest
//
//  Created by Alfredo Tochon on 4/8/22.
//

import Foundation

// MARK: - Networking call within this class will happen
struct MyData: MyDataSource

{
    func getData(url: String, headers: BaseHeaders, completion: @escaping (BaseResponse?, ErrorResponse?) -> Void) {
        
       
        /// here we create the event that represent the endpoint
        let event = API(path: EndPoints.MyDataRemote.getStores(url: url) ,
                        method: .get,
                        headerParamaters: headers.headers
       )
       
       ///here we call the request with our type and completion handler
       BaseNetworking.shared.request(BaseResponse.self,
                                             endPoint:event,completion: completion);
    }
    
    
    
}
