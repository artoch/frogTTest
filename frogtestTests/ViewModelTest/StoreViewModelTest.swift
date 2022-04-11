//
//  StoreViewModelTest.swift
//  frogtestTests
//
//  Created by Alfredo Tochon on 4/10/22.
//

import Foundation
import Combine

@testable import frogtest

class StoreViewModelTest : BaseViewModel {
    
    var nextPage = Constants.EMPTY_STRING
    var apiResponse: BaseResponse?
    
    init() {
        
        let repository = DataRepositoryIMPLTest(remote: MyData())
        
        let storeUseCase = DataUseCaseTest()
        ///we will force unrwape the id beacuse it's impossible not to have value
        storeUseCase.fetchData = FetchDataTest(repository: repository, nextUrl: nextPage)
        
        super.init(useCase: storeUseCase)
    }
    
    init(useCase: DataUseCase) {
        super.init(useCase: useCase)
    }
    
    
    
    func fetchData() -> Future<Response?, ErrorResponse>? {
        let viewModelUseCase = self.useCase as! DataUseCaseTest
        return viewModelUseCase.fetchData?.startOKData()
    }
    
    func fetchDataErrorToken() -> Future<Response?, ErrorResponse>? {
        let viewModelUseCase = self.useCase as! DataUseCaseTest
        return viewModelUseCase.fetchData?.startErrorToken()
    }
    
    func fetchDataErrorCompanyUID() -> Future<Response?, ErrorResponse>? {
        let viewModelUseCase = self.useCase as! DataUseCaseTest
        return viewModelUseCase.fetchData?.startErrorCompanyUID()
    }
}
