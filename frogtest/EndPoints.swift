//
//  EndPoints.swift
//  frogtest
//
//  Created by Alfredo Tochon on 4/8/22.
//

import Foundation

/// will be responsible for holding the end points name
/// also will help to separate the endpoints by its controller/feature
struct EndPoints {
    
    static let STORES = "stores?per_page=\(Constants.pageSize)"
    
 
    ///Holdinh all APIs for car types
    struct MyDataRemote {
        ///we should add the name of the controller here
        ///for now we don't have controller name
        
        static func getStores(url: String) -> String {
            var resultUrl = Constants.EMPTY_STRING
            
            if (url.isEmpty) {
                resultUrl = Constants.BASE_URL + Constants.BACK_V + STORES
            }else{
                resultUrl = url
            }
            
            return resultUrl
        }
        
    }
}
