//
//  FetchDataTest.swift
//  frogtestTests
//
//  Created by Alfredo Tochon on 4/10/22.
//

import Foundation
@testable import frogtest

import Combine

/// this will be responsible for doing one task only
class FetchDataTest {
    

    let repository: DataRepositoryTest
    var nextUrl: String

    init(repository: DataRepositoryTest, nextUrl: String ) {
        self.repository = repository
        self.nextUrl = nextUrl
    }

    func startOKData() -> Future<Response?,ErrorResponse> {
        Future { [weak self] promise in
            
            self?.repository.getData(nextUrl: self?.nextUrl ?? Constants.EMPTY_STRING ) { result, error in
                
                if result != nil {

                    if let data = result as? BaseResponse {
                        promise(Result.success(data))
                    }
                }
                else {
                    promise(Result.failure(error!))
                }
            }
        }
    }
    
    func startErrorToken() -> Future<Response?,ErrorResponse> {
        Future { [weak self] promise in
            
            self?.repository.getDataWithErrorToken(nextUrl: self?.nextUrl ?? Constants.EMPTY_STRING ) { result, error in
                
                if result != nil {

                    if let data = result as? BaseResponse {
                        promise(Result.success(data))
                    }
                }
                else {
                    promise(Result.failure(error!))
                }
            }
        }
    }
    
    func startErrorCompanyUID() -> Future<Response?,ErrorResponse> {
        Future { [weak self] promise in
            
            self?.repository.getDataWithErrorCompanyUid(nextUrl: self?.nextUrl ?? Constants.EMPTY_STRING ) { result, error in
                
                if result != nil {

                    if let data = result as? BaseResponse {
                        promise(Result.success(data))
                    }
                }
                else {
                    promise(Result.failure(error!))
                }
            }
        }
    }

}
