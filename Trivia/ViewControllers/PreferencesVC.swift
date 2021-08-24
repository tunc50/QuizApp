//
//  PreferencesViewController.swift
//  Trivia
//
//  Created by Kuka on 20.08.2021.
//

import UIKit

class PreferencesVC: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var questionNumLabel: UILabel!
    
    @IBOutlet weak var difficultyLabel: UILabel!
    
    @IBOutlet weak var sliderNumberLabel: UILabel!
    
    @IBOutlet weak var sliderQuestionNumber: UISlider!
    var difficulty = ""
    var chosenNumberOfQuestions = 0
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func easyButtonClicked(_ sender: Any) {
        difficulty = "easy"
    }
    
    @IBAction func mediumButtonClicked(_ sender: Any) {
        difficulty = "medium"
    }
    
    @IBAction func hardButtonClicked(_ sender: Any) {
        difficulty = "hard"
    }
    
    @IBAction func startQuizButtonClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "QuizStart", sender: nil)
    }
    
    @IBAction func sliderBarQuestionNumber(_ sender: Any) {

        chosenNumberOfQuestions = Int(sliderQuestionNumber.value)
        sliderNumberLabel.text = String(Int(sliderQuestionNumber.value))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "QuizStart" {
            let destinationVC = segue.destination as! AppViewController
            destinationVC.selectedquestionNum = chosenNumberOfQuestions
        }
        
    }
    
    @IBAction func saveSettingsClicked(_ sender: Any) {
        APICaller(amount: chosenNumberOfQuestions, difficulty: difficulty)
    }
    
       
}
