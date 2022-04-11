//
//  BaseResponse.swift
//  frogtest
//
//  Created by Alfredo Tochon on 4/8/22.
//

import Foundation

// MARK: - BASE
struct BaseResponse: Response {
    var data: [Datum]
    let meta: Meta
    let links: Links
    
    enum CodingKeys:String, CodingKey{
        case data
        case meta
        case links
    }
}
