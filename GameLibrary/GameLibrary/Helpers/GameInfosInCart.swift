//
//  GameInfosInCart.swift
//  GameLibrary
//
//  Created by Berkin KABADAYI on 29.12.2020.
//

import Foundation

class GameInfosInCart {
    static let shared = GameInfosInCart()
    
    var selectedGameList: [CartItem] = []
}
