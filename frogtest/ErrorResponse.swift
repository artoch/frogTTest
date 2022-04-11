//
//  ErrorResponse.swift
//  frogtest
//
//  Created by Alfredo Tochon on 4/8/22.
//

import Foundation

///will Hold the error response with suitable message
struct ErrorResponse: Encodable, Error {

    let message: String
    
}

struct BaseErrorApi: Decodable {
    let errors: [ErrorApi]
}

struct ErrorApi: Decodable {
    let id: String
    let title: String
}


extension BaseErrorApi {
    func toErrorResponse() -> String {
        if (self.errors.count > 0) {
            return self.errors[0].title
        }else{
            return "server_error".localized
        }
    }
}
