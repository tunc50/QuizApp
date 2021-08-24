//
//  ViewController.swift
//  Trivia
//
//  Created by Kuka on 17.08.2021.
//

import UIKit


class ViewController: UIViewController {

   
    @IBOutlet weak var scoreLabel: UILabel!
    var score = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        scoreLabel.text = "Score: \(score)"
        
    }

    @IBAction func startButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "Start", sender: nil)
    }
}

