//
//  DataRepository.swift
//  frogtest
//
//  Created by Alfredo Tochon on 4/8/22.
//

import Foundation

// this will be our abstract class for defining car type repository
protocol DataRepository {
    
    //we should add the implementation for this
    //we don't know where it's going to fetch data local or remote
    //for now we only care for remote
    func getData(nextUrl: String, completion: @escaping (_ result: Response?, _ error: ErrorResponse?) -> Void)
    
}
