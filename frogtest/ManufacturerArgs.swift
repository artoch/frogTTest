//
//  ManufacturesRequest.swift
//  frogtest
//
//  Created by Alfredo Tochon on 4/8/22.
//

import Foundation

struct ManufacturerArgs: PagingRequest, Codable {
    
    var page, pageSize: Int
}
