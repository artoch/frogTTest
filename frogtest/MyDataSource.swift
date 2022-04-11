//
//  MyDataSource.swift
//  frogtest
//
//  Created by Alfredo Tochon on 4/8/22.
//

import Foundation
import Alamofire

///This will be our generic data source
///each data source for data should implement this data source and fulfill its functions implementation
protocol MyDataSource {
 
    func getData(url: String, headers: BaseHeaders, completion: @escaping (_ result: BaseResponse?, _ error: ErrorResponse?) -> Void)
    
}
