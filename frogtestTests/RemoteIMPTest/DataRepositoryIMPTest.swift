//
//  DataRepositoryIMPTest.swift
//  frogtestTests
//
//  Created by Alfredo Tochon on 4/10/22.
//

import Foundation
@testable import frogtest

import Alamofire

///Thtis class will be reponsible for implementing the Repository from the Domain Layer
final class DataRepositoryIMPLTest {

    //this will represent the networking service for car type
    //we can have another one for local if we had local storage
    private let remoteDateSource: MyDataSource
    
    init(remote: MyDataSource) {
        self.remoteDateSource = remote
    }
}

extension DataRepositoryIMPLTest: DataRepositoryTest{
    
    func getData(nextUrl: String, completion: @escaping (Response?, ErrorResponse?) -> Void) {

        remoteDateSource.getData(url: nextUrl, headers: storeHeaders, completion: completion)
        
    }
    
    func getDataWithErrorToken(nextUrl: String, completion: @escaping (Response?, ErrorResponse?) -> Void) {
        
        var headersX = StoreHeaders()
        headersX.headers  = ["Authorization": Constants.TOKEN + "DDD", "X-Company-UUID": Constants.COMPANY_UID, "Content-Type" : Constants.CONTENT_TYPE]
        
        remoteDateSource.getData(url: nextUrl, headers: headersX, completion: completion)
        
    }
    
    func getDataWithErrorCompanyUid(nextUrl: String, completion: @escaping (Response?, ErrorResponse?) -> Void) {
        
        var headersX = StoreHeaders()
        headersX.headers  = ["Authorization": Constants.TOKEN, "X-Company-UUID": Constants.COMPANY_UID + "DDD", "Content-Type" : Constants.CONTENT_TYPE]
        
        remoteDateSource.getData(url: nextUrl, headers: headersX, completion: completion)
        
    }
    
    
}

