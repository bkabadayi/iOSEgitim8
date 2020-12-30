//
//  ViewController.swift
//  GameLibrary
//
//  Created by Berkin KABADAYI on 29.12.2020.
//

import UIKit

final class GamesVC: UIViewController {
    
    @IBOutlet weak var appInfoLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var goToCartButton: UIButton!
    
    var gameArray: [CartItem] = []
    
//MARK: - LIFECYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareItems()
        prepareUI()
    }
    
    fileprivate func prepareItems() {
        let valhalla = CartItem(imageName: "valhalla", name: "AC - Valhalla", publisher: "Ubisoft", size: "62 GB", category: "Action", multiplayer: "NO", price: "73")
        let rdr2 = CartItem(imageName: "rdr2", name: "Red Dead Redemption 2", publisher: "Rockstar Games", size: "89 GB", category: "Action", multiplayer: "NO", price: "210")
        let apex = CartItem(imageName: "apex", name: "Apex Legends", publisher: "Respawn Entertainment", size: "52 GB", category: "First Person Shooter", multiplayer: "YES", price: "10")
        let eu4 = CartItem(imageName: "eu4", name: "Europa Universalis 4", publisher: "Paradox Entertainment", size: "25 GB", category: "Strategy", multiplayer: "YES", price: "40" )
        let fallout4 = CartItem(imageName: "fallout4", name: "Fallout 4", publisher: "Bethesda Studios", size: "80 GB", category: "Role Playing Game", multiplayer: "NO", price: "90")
        let csgo = CartItem(imageName: "csgo", name: "CS - GO", publisher: "Valve", size: "42 GB", category: "First Person Shooter", multiplayer: "YES", price: "5")
        let clickfast = CartItem(imageName: "clickfast", name: "ClickFast", publisher: "Raveloren", size: "50 MB", category: "Challenge", multiplayer: "NO", price: "F2P")
        let skyrim = CartItem(imageName: "skyrim", name: "Elder Scrolls : Skyrim", publisher: "Bethesda Studios", size: "38 GB", category: "Role Playing Game", multiplayer: "NO", price: "45")
       
        
        gameArray = [valhalla, rdr2, apex, eu4, fallout4, csgo, clickfast, skyrim]
    }
    
    fileprivate func prepareUI() {
        navigationItem.title = "STORE"
        appInfoLabel.text = "Welcome to Rave GameStore! \n \n Latest games at cheapest price!"
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
        collectionView.register(ImageCollectionViewCell.nib(), forCellWithReuseIdentifier: "ImageCollectionViewCell")
    }
    
    @IBAction func goToCartButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let cartVC = storyboard.instantiateViewController(identifier: "CartVC") as! CartVC
        self.navigationController?.pushViewController(cartVC, animated: true)
    }
}

//MARK: - UICOLLECTIONVIEW METHODS

extension GamesVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let gameDetailsVC = storyboard.instantiateViewController(identifier: "GameDetailsVC") as! GameDetailsVC
        gameDetailsVC.gameInfo = gameArray[indexPath.row]
        self.navigationController?.pushViewController(gameDetailsVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let games = gameArray[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        cell.setCell(item: games)
        return cell
    }
}

extension GamesVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.collectionView.frame.width - 20) / 2, height: 160)
    }
}
