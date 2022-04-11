//
//  Datum.swift
//  frogtest
//
//  Created by Alfredo Tochon on 4/8/22.
//

import Foundation

struct Datum : Codable {
    let id: String
    let type: String
    let attributes: Attributes
    
    enum CodingKeys:String, CodingKey{
        case id
        case type
        case attributes
    }
}
