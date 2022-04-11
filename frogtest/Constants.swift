//
//  Constants.swift
//  frogtest
//
//  Created by Alfredo Tochon on 4/8/22.
//

import Foundation

struct Constants {

    static let EMPTY_STRING = ""
    static let BASE_URL = ProcessInfo.processInfo.environment["BASE_URL"] ?? EMPTY_STRING
    static let BACK_V = ProcessInfo.processInfo.environment["BACK_V"] ?? EMPTY_STRING
    static let COMPANY_UID = ProcessInfo.processInfo.environment["COMPANY_UID"] ?? EMPTY_STRING
    static let TOKEN = ProcessInfo.processInfo.environment["TOKEN"] ?? EMPTY_STRING
    static let CONTENT_TYPE = ProcessInfo.processInfo.environment["CONTENT_TYPE"] ?? EMPTY_STRING
    static let pageSize = 10
    
}
