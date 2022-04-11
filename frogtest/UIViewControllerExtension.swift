//
//  UIViewControllerExtension.swift
//  frogtest
//
//  Created by Alfredo Tochon on 4/8/22.
//

import Foundation

import UIKit


extension UIViewController {
    
    func showAlert(title: String, message: String, completion:  @escaping (UIAlertAction) -> Void) {
    let alertController = UIAlertController(title: title, message:
      message, preferredStyle: .alert)
      
      alertController.addAction(UIAlertAction(title: "submit_button_title".localized, style: .default, handler: completion))
      
    self.present(alertController, animated: true, completion: nil)
  }
}
