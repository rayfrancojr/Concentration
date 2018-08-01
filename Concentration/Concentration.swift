//
//  Concentration.swift
//  Concentration
//
//  Created by Raphael A Franco on 7/31/18.
//  Copyright © 2018 Eleix. All rights reserved.
//

/*---------------------------------------\
| class Concentration is the model -     |
| It is the "what" the program does.     |
| It is UI independance.                 |
\---------------------------------------*/

import Foundation

class Concentration
{
    var cards = [Card]()
    
    func choseCard(at index: Int){
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        } else {
            cards[index].isFaceUp = true
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
        let card = Card()
            cards += [card, card]
        }
    }
    
    //TODO Shuffle the Cards
    
}
