//
//  BaseViewModel.swift
//  frogtest
//
//  Created by Alfredo Tochon on 4/8/22.
//

import Foundation
import UIKit


protocol BaseViewModelProtocol {
    associatedtype U
}

class BaseViewModel: BaseViewModelProtocol{
    typealias U = UseCase
    
    var useCase: U?
    var showError: Bool = false
    var isLoading: Bool = false

    init(useCase: U) {
        self.useCase = useCase
    }
}

