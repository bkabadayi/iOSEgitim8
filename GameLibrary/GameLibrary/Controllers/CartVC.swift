//
//  CartVC.swift
//  GameLibrary
//
//  Created by Berkin KABADAYI on 29.12.2020.
//

import UIKit

final class CartVC: UIViewController {
    
    @IBOutlet weak var cartInfoLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var cartButton: UIButton!
    
    
//MARK: - LIFECYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    fileprivate func prepareUI() {
        prepareLabels()
        prepareTableView()
    }
    
    fileprivate func prepareLabels() {
        var totalPrice = 0
        for item in GameInfosInCart.shared.selectedGameList{
            totalPrice += Int(item.price) ?? 0
        }
        totalPriceLabel.text = "TOTAL PRICE : $" + String (totalPrice)
    }
    
    fileprivate func prepareTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "CartTableViewCell")
        tableView.reloadData()
    }
    
    @IBAction func cartButtonPressed(_ sender: Any) {
        GameInfosInCart.shared.selectedGameList.removeAll()
        prepareLabels()
        tableView.dataSource = nil
        tableView.reloadData()
        self.view.makeToast("Your orders are being prepared!", duration: 2.5, position: .center)
    }
}

// MARK: - UITableViewDataSource Methods

extension CartVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GameInfosInCart.shared.selectedGameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
        cell.setTableViewCell(item: GameInfosInCart.shared.selectedGameList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            GameInfosInCart.shared.selectedGameList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            prepareLabels()
            tableView.endUpdates()
        }
    }
}

// MARK: - UITableViewDelegate Methods

extension CartVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
