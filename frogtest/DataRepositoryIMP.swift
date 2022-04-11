//
//  DataRepositoryIMP.swift
//  frogtest
//
//  Created by Alfredo Tochon on 4/8/22.
//

import Foundation
import Alamofire

///Thtis class will be reponsible for implementing the Repository from the Domain Layer
final class DataRepositoryIMPL {

    //this will represent the networking service for car type
    //we can have another one for local if we had local storage
    private let remoteDateSource: MyDataSource
    
    init(remote: MyDataSource) {
        self.remoteDateSource = remote
    }
}

extension DataRepositoryIMPL: DataRepository{
    
    func getData(nextUrl: String, completion: @escaping (Response?, ErrorResponse?) -> Void) {

        remoteDateSource.getData(url: nextUrl, headers: storeHeaders, completion: completion)
        
    }
    
}
