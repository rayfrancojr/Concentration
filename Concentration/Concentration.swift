//
//  Concentration.swift
//  Concentration
//
//  Created by Raphael A Franco on 7/31/18.
//  Copyright © 2018 Eleix. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    
    func choseCard(at index: Int){
        
    }
    
    init(numberOfPairsOfCards: Int) {
        for identifier in 1...numberOfPairsOfCards {
        let card = Card(identifier: identifier)
            cards += [card, card]
        }
    }
    
}
