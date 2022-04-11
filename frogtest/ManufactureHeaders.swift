//
//  ManufactureHeaders.swift
//  frogtest
//
//  Created by Alfredo Tochon on 4/9/22.
//

import Foundation
import Alamofire

struct StoreHeaders : BaseHeaders {
    var headers: HTTPHeaders = ["Authorization": Constants.TOKEN, "X-Company-UUID": Constants.COMPANY_UID, "Content-Type" : Constants.CONTENT_TYPE]
}

let storeHeaders = StoreHeaders()
