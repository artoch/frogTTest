//
//  BaseViewController.swift
//  frogtest
//
//  Created by Alfredo Tochon on 4/8/22.
//

import Foundation
import UIKit


class BaseViewController<T: BaseViewModel, R: BaseRouter>: UIViewController {
    var viewModel: T?
    var router: R?
}

