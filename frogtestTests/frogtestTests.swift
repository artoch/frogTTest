//
//  frogtestTests.swift
//  frogtestTests
//
//  Created by Alfredo Tochon on 4/8/22.
//

import XCTest
import Combine
@testable import frogtest

class frogtestTests: XCTestCase {

    var storeViewModel: StoreViewModelTest?
    var observers: [AnyCancellable]?
    
    override func setUpWithError() throws {
        storeViewModel = StoreViewModelTest()
        observers = []
    }

    override func tearDownWithError() throws {
        storeViewModel = nil
        observers = nil
    }

    func test_get_data_from_api() throws {
        let exp = expectation(description: "Wait for result get correct data")
        storeViewModel?.fetchData()?.receive(on: DispatchQueue.main).sink( receiveCompletion: {completion in
            switch completion {
            case .finished:
                print("Finished calling")
            case .failure(let error):
                print("Error calling \(error)")
            }
        }, receiveValue: { response in
            XCTAssertNotNil(response)
            exp.fulfill()
        }).store(in: &observers!)
        waitForExpectations(timeout: 5)
    }
    
    func test_get_error_from_token() throws {
        let exp = expectation(description: "Wait for result error token")
        storeViewModel?.fetchDataErrorToken()?.receive(on: DispatchQueue.main).sink( receiveCompletion: {completion in
            switch completion {
            case .finished:
                print("Finished calling")
            case .failure(let error):
                XCTAssertNotNil(error)
                print("Error calling \(error)")
                exp.fulfill()
            }
        }, receiveValue: { response in
            XCTAssertNil(response)
            exp.fulfill()
        }).store(in: &observers!)
        waitForExpectations(timeout: 5)
    }
    
    func test_get_error_from_company_uid() throws {
        let exp = expectation(description: "Wait for result error company uid")
        storeViewModel?.fetchDataErrorCompanyUID()?.receive(on: DispatchQueue.main).sink( receiveCompletion: {completion in
            switch completion {
            case .finished:
                print("Finished calling")
            case .failure(let error):
                XCTAssertNotNil(error)
                print("Error calling \(error)")
                exp.fulfill()
            }
        }, receiveValue: { response in
            XCTAssertNil(response)
            exp.fulfill()
        }).store(in: &observers!)
        waitForExpectations(timeout: 5)
    }

}
