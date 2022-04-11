//
//  ListStoreViewModel.swift
//  frogtest
//
//  Created by Alfredo Tochon on 4/10/22.
//

import Foundation
import Combine


class ListStoreViewModel : BaseViewModel {
    
    var nextPage = Constants.EMPTY_STRING
    var apiResponse: BaseResponse?
    var pageNumber = 0
    var isFinish = false
    
    var totalPages: Int {
        get {
            return apiResponse?.meta.pagination.total ?? 0
        }
    }
    
    var currentCount: Int {
        get {
            return apiResponse?.data.count ?? 0
        }
    }
    
    var oldCount: Int = 0
    
    var shouldFetchNextPage: Bool {
        get {
            return !isLoading && pageNumber < totalPages
        }
    }
    
    init() {
        
        let repository = DataRepositoryIMPL(remote: MyData())
        
        let storeUseCase = DataUseCase()
        ///we will force unrwape the id beacuse it's impossible not to have value
        storeUseCase.fetchData = FetchData(repository: repository, nextUrl: nextPage, pageNumber: pageNumber)
        
        super.init(useCase: storeUseCase)
    }
    
    init(useCase: DataUseCase) {
        super.init(useCase: useCase)
    }
    
    
    func fetchData() -> Future<Response?, ErrorResponse>? {
        let viewModelUseCase = self.useCase as! DataUseCase
        
        self.isLoading = true
        self.showError = false
        
        viewModelUseCase.fetchData?.pageNumber = pageNumber
        viewModelUseCase.fetchData?.nextUrl = nextPage
        
        return viewModelUseCase.fetchData?.start()
    }
    
    ///to avoid reloading all the data
    func calculateIndexPathsToReload(from newCount: Int ) -> [IndexPath] {
        return PresentationHelper.calculateIndexPathsToReload(from: newCount, oldCount: oldCount, section: 0)
    }
    
    func handleResponse(response: Response) {
        let respon = response as! BaseResponse
        if(apiResponse == nil) {
            apiResponse = respon
        } else {
            oldCount = currentCount
            apiResponse?.data.append(contentsOf: respon.data)
        }
        nextPage = respon.links.next ?? Constants.EMPTY_STRING
        if (respon.links.next == nil){
            isFinish = true
        }
    }
    
    func itemName(index: Int) -> String {
        return apiResponse?.data[index].attributes.name ?? ""
    }
    
    func itemCode(index: Int) -> String {
        return apiResponse?.data[index].attributes.code ?? ""
    }
    
    func getStoreAddress(index: Int) -> String {
        return apiResponse?.data[index].attributes.fullAddress ?? ""
    }
    
    func getStoreTitle(index: Int) -> String {
        return itemName(index: index) + " | " + itemCode(index: index)
    }
    
}
