//
//  Meta.swift
//  frogtest
//
//  Created by Alfredo Tochon on 4/8/22.
//

import Foundation

// MARK: - Meta
struct Meta: Codable {
    let pagination: Pagination
    
    enum CodingKeys:String, CodingKey{
        case pagination
    }
    
}


// MARK: - Pagination
struct Pagination: Codable {
    let currentPage, total, perPage: Int
    
    enum CodingKeys:String, CodingKey{
        case currentPage = "current_page"
        case total
        case perPage = "per_page"
    }
    
}
