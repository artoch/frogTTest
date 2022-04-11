//
//  FetchData.swift
//  frogtest
//
//  Created by Alfredo Tochon on 4/8/22.
//

import Foundation

import Combine

/// this will be responsible for doing one task only
class FetchData: SingleUseCase {
    

    let repository: DataRepository
    var pageNumber: Int
    var nextUrl: String

    init(repository: DataRepository, nextUrl: String, pageNumber: Int ) {
        self.repository = repository
        self.nextUrl = nextUrl
        self.pageNumber = pageNumber
    }

    func start() -> Future<Response?,ErrorResponse> {
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

}
