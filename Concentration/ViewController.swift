//
//  ViewController.swift
//  Concentration
//
//  Created by Raphael A Franco on 4/14/18.
//  Copyright © 2018 Eleix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func touchCard(_ sender: UIButton) {
       flipCard(withEmoji: "👻", on: sender)
    }
    
    func flipCard(withEmoji Emoji: String, on button: UIButton) {
        if button.currentTitle == "👻" {
          button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }
        else {
            button.setTitle("👻", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        }
}

