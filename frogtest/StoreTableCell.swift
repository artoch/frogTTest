//
//  StoreTableCell.swift
//  frogtest
//
//  Created by Alfredo Tochon on 4/9/22.
//

import UIKit

class StoreTableCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(name: String, address: String){
        titleLabel.text = name
        addressLabel.text = address
    }
    
    func setupCell(data: Attributes) {
        titleLabel.text = "\(data.name) | \(data.code)"
        addressLabel.text = data.fullAddress
    }
    
}
