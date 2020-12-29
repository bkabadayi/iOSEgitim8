//
//  ImageCollectionViewCell.swift
//  GameLibrary
//
//  Created by Berkin KABADAYI on 29.12.2020.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var labelCell: UILabel!
    @IBOutlet weak var detailButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCell(item: Item) {
        imageCell.image = UIImage(named: item.imageName)
        labelCell.text = item.name
    }
    
    static func nib() ->UINib {
        return UINib(nibName: "ImageCollectionViewCell", bundle: nil)
    }
    
    @IBAction func detailButtonPressed(_ sender: Any) {
    }
}
