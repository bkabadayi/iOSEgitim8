//
//  GameDetailsVC.swift
//  GameLibrary
//
//  Created by Berkin KABADAYI on 29.12.2020.
//

import UIKit
import Toast

final class GameDetailsVC: UIViewController {
    
    var gameInfo: CartItem = CartItem.init(imageName: "", name: "", publisher: "", size: "", category: "", multiplayer: "", price: "")
    
    @IBOutlet weak var detailImageView: UIImageView!
    
    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailPublisherLabel: UILabel!
    @IBOutlet weak var detailSizeLabel: UILabel!
    @IBOutlet weak var detailCategoryLabel: UILabel!
    @IBOutlet weak var detailMultiplayerLabel: UILabel!
    
    @IBOutlet weak var addToCartButton: UIButton!
    
//MARK: - LIFECYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    func prepareUI() {
        prepareLabelTexts()
    }
    
    func prepareLabelTexts() {
        detailImageView.image = UIImage(named: gameInfo.imageName)
        detailNameLabel.text = "\t Name : " + gameInfo.name
        detailPublisherLabel.text = "\t Publisher : " + gameInfo.publisher
        detailSizeLabel.text = "\t Size : " + gameInfo.size
        detailCategoryLabel.text = "\t Category : " + gameInfo.category
        detailMultiplayerLabel.text = "\t Multiplayer : " + gameInfo.multiplayer
    }
    
    func prepareCart() {
        GameInfosInCart.shared.selectedGameList.append(gameInfo)
    }
    
    @IBAction func addToCartButtonPressed(_ sender: Any) {
        prepareCart()
        self.view.makeToast("\(gameInfo.name) is added to your cart!", duration: 2.5, position: .center)
    }   
}
