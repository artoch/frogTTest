//
//  PagingRequest.swift
//  frogtest
//
//  Created by Alfredo Tochon on 4/8/22.
//

import Foundation

protocol PagingRequest: Codable {
    
    var page: Int { get set}
    var pageSize: Int { get set}
    

}
