//
//  Concentration.swift
//  Concentration
//
//  Created by Raphael A Franco on 7/31/18.
//  Copyright © 2018 Eleix. All rights reserved.
//

/*---------------------------------------\x
| class Concentration is the model -     |
| It is the "what" the program does.     |
| It is UI independance.                 |
\---------------------------------------*/

import Foundation

class Concentration
{
    var cards = [Card]()

    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else { // this is the second up card
                        return nil
                    }
                }
            }
            return foundIndex
            
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func choseCard(at index: Int){
        assert(cards.indices.contains(index), "Concentration.choseCard(at: \(index)) is not in the cards")
        if !cards[index].isMatched // Do nothing if the card is already matched
        {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index
            // if one card and onlt one card is turned up
            // and you did not click on the same card that is turn up
            {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
//              indexOfOneAndOnlyFaceUpCard = nil
                
            } else {
                // two cards are down or up
//                for flipDownIndex in cards.indices {
//                    cards[flipDownIndex].isFaceUp = false
//                }
//                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init - numberOfPairsOfCards is 0 or negative")
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
        
        shuffleCards()
        
        print("After Shuffling")
        for index in 0..<cards.count {
            print("cards[\(index)].indentifer = \(cards[index].identifier)")
        }    }
    
    //TODO Shuffle the Cards
    /*-------------------------------------------------
     Why does the instruction want or suggest that
     the shuffle cards should be in the model?
    --------------------------------------------------*/
    func shuffleCards() {
        for index in cards.indices {
            let randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
            let tempCard = cards[index]
            cards[index] = cards[randomIndex]
            cards[randomIndex] = tempCard
        }
    }

    func reset() {
        for index in cards.indices {
            cards[index].isFaceUp = false
            cards[index].isMatched = false
        }
        shuffleCards()
      indexOfOneAndOnlyFaceUpCard = nil
    }

}
