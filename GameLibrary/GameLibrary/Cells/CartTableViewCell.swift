//
//  CartTableViewCell.swift
//  GameLibrary
//
//  Created by Berkin KABADAYI on 29.12.2020.
//

import UIKit

final class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var tableViewCellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setTableViewCell(item: CartItem) {
        tableViewCellLabel.text = "\t" + item.name + "\t $" + item.price
    }
    
}
