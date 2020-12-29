//
//  ViewController.swift
//  GameLibrary
//
//  Created by Berkin KABADAYI on 29.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var gameArray: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareItems()
        prepareUI()
    }
    
    fileprivate func prepareItems() {
        let eu4 = Item(imageName: "eu4", name: "Europa Universalis 4")
        let apex = Item(imageName: "apex", name: "Apex Legends")
        let fallout4 = Item(imageName: "fallout4", name: "Fallout 4")
        let csgo = Item(imageName: "csgo", name: "CS:GO")
        let clickfast = Item(imageName: "clickfast", name: "ClickFast")
        let skyrim = Item(imageName: "skyrim", name: "Elder Scrolls : Skyrim")
        
        gameArray = [eu4, apex, fallout4, csgo, clickfast, skyrim]
    }
    
    fileprivate func prepareUI() {
        navigationItem.title = "Games"
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
        collectionView.register(ImageCollectionViewCell.nib(), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize (width: 150, height: 150)
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if indexPath.row / 2 == 0 {
//            let games = gameArray[indexPath.row]
//            if let leftCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewLeftCell", for: indexPath) as? ImageCollectionViewLeftCell {
//                leftCell.setLeftCell(item: games)
//                return leftCell
//            }
//        }else if indexPath.row / 2 == 1 {
//            let games = gameArray[indexPath.row]
//            if let rightCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewRightCell", for: indexPath) as? ImageCollectionViewRightCell {
//                rightCell.setRightCell(item: games)
//                return rightCell
//            }
//        }
        let games = gameArray[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        cell.setCell(item: games)
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
}
