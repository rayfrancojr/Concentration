//
//  ViewController.swift
//  Concentration
//
//  Created by Raphael A Franco on 4/14/18.
//  Copyright © 2018 Eleix. All rights reserved.
//

/*--------------------------------------------------\
| The concentraction game should be writtien such   |
| that the number of cards can esaily be chnaged.
 -----------------------------------------------------------*/

/*----------------------------------------------------------\
| Cards or Buttons that are turned over, do not have titles |
\----------------------------------------------------------*/

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards : (cardButtons.count + 1) / 2)
    
    var flipCount = 0 {
        didSet {flipCountLabel.text = "Flips = \(flipCount)"}
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
   
    @IBOutlet var cardButtons: [UIButton]!
    

    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            print("cardNunber = \(cardNumber)")
            game.choseCard(at: cardNumber)
            /*-------------------------\
            | The Model has changed.   |
            | We have flipped a card   |
            | via choseCard()          |
            \-------------------------*/
            updateViewFromModel()
        } else {
            print("index is nil")
        }
    }

    
    
/*--------------------------------------------------------\
| We are in the viewController. The Controller can        |
| communicate with both the Model and the View            |
\--------------------------------------------------------*/
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index] // UI Dependent = View
            let card = game.cards[index]    // UI Independent = Model
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
     var emojiChoices = ["🦇","😱","🙀","😈","🎃","👻","🍭","🍬","🍎"]
    
    var emoji = [Int: String]()

    /*------------------------------------------------------------\
    | This function return an emoji.                              |
    | If the associate emoji is nil, it assigns one,              |
    | and it removes the assigned emoji from the emojiChoices     |
    -------------------------------------------------------------*/
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil , emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        /*----------------------------------------
        if emoji[card.identifier] != nil {
            return emoji[card.identifier]!
        } else {
         return "?"
        }
        ----------------------------------------*/
        return emoji[card.identifier] ?? "?"
    }    
    
    @IBAction func Reset(_ sender: UIButton) {
        emoji = [:]
        emojiChoices = ["🦇","😱","🙀","😈","🎃","👻","🍭","🍬","🍎"]
        game.indexOfOneAndOnlyFaceUpCard = nil
        flipCount = 0
        game.shuffleCards()
        for index in cardButtons.indices {
        // a cardButton is a UIButton, which is
        // a class and is passed by reference
            let button = cardButtons[index]
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
           //a card is a struct, which is passed by value
            game.cards[index].isFaceUp = false
            game.cards[index].isMatched = false
        }
    }
}

