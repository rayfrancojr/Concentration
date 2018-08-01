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
    
    func emoji(for card: Card) -> String {
       return "?"
    }

    
}

