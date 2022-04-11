//
//  Attributes.swift
//  frogtest
//
//  Created by Alfredo Tochon on 4/8/22.
//

import Foundation

// MARK: - Attributes
struct Attributes : Codable {
    let name: String
    let code: String
    let active: Bool
    let fullAddress: String
    //let createdAt: Date
    
    enum CodingKeys:String, CodingKey{
        case name
        case code
        case active
        case fullAddress = "full_address"
        //case createdAt = "created_at"
    }
    
}
