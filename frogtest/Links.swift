//
//  MainEntity.swift
//  frogtest
//
//  Created by Alfredo Tochon on 4/8/22.
//

import Foundation

struct Links: Codable {
    let prev: String?
    let next: String?
    let last: String
    let first: String
    let linkSelf: String
    
    enum CodingKeys:String, CodingKey{
        case prev
        case next
        case last
        case first
        case linkSelf = "self"
    }
}

