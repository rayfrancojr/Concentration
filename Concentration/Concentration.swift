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

    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func choseCard(at index: Int){
        if !cards[index].isMatched // Do nothing if the card is already matched
        {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
                
            } else {
                // two cards are down or up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        print("excuting Concentration Init")
        for _ in 1...numberOfPairsOfCards {
        let card = Card()
            cards += [card, card]
        }
        /*-----------------------------\
        | My Debugging                 |
        \-----------------------------*/
        print("cards.count = \(cards.count)")
        for index in 0..<cards.count {
            print("cards[\(index)].indentifer = \(cards[index].identifier)")
        }
    }
    
    //TODO Shuffle the Cards
    
}
