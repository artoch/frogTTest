//
//  BaseHeaders.swift
//  frogtest
//
//  Created by Alfredo Tochon on 4/9/22.
//

import Foundation
import Alamofire

protocol BaseHeaders {
    var headers: HTTPHeaders {get set}
}
