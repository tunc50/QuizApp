//
//  AppViewController.swift
//  Trivia
//
//  Created by Kuka on 17.08.2021.
//

import UIKit


var quizDictionary: [Result] = []

class AppViewController: UIViewController {

    
    
    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var firstChoiceButton: UIButton!
    @IBOutlet weak var secondChoiceButton: UIButton!
    @IBOutlet weak var thirdChoiceButton: UIButton!
    @IBOutlet weak var fourthChoiceButton: UIButton!
    
    
    
    var questionNum = 1
    var score = 0
    var counter = 0
    var selectedquestionNum = 0
    var correctAnswer = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.adjustsFontSizeToFitWidth = true
      
        
        var question = quizDictionary[counter].question
        correctAnswer = quizDictionary[counter].correctAnswer.removingPercentEncoding!

        questionLabel.sizeToFit()
        questionNumber.text = "Question: \(questionNum)"
        scoreLabel.text = "Score: \(score)"
        question = question?.removingPercentEncoding
        questionLabel.text = "\(question ?? "empty")"
        checkQuestionType()
         
        }
    
    func hideChoiceButtons() {
        trueButton.isHidden = false
        falseButton.isHidden = false
        firstChoiceButton.isHidden = true
        secondChoiceButton.isHidden = true
        thirdChoiceButton.isHidden = true
        fourthChoiceButton.isHidden = true
        
    }
    
    func hideTrueFalseButtons() {
        firstChoiceButton.isHidden = false
        secondChoiceButton.isHidden = false
        thirdChoiceButton.isHidden = false
        fourthChoiceButton.isHidden = false
        trueButton.isHidden = true
        falseButton.isHidden = true
    }
    
    func nextQuestion() {
        counter += 1
        if counter < selectedquestionNum {
            questionNum += 1
            self.questionNumber.text = "Question: \(questionNum)"
            
            self.questionLabel.text = "\(quizDictionary[counter].question.removingPercentEncoding ?? "empty")"
            checkQuestionType()
            print(quizDictionary[counter].correctAnswer ?? "missing answer")
        } else if counter == selectedquestionNum {
            counter = 0
            performSegue(withIdentifier: "Finished", sender: nil)
        }
    }
    
    func checkQuestionType() {
        if quizDictionary[counter].type == "boolean" {
            hideChoiceButtons()
        } else if quizDictionary[counter].type == "multiple" {
            hideTrueFalseButtons()
            correctAnswer = quizDictionary[counter].correctAnswer.removingPercentEncoding!
            choiceAnswers()
            }
    }
    
    
    func choiceAnswers() {
        
        
        
        let answerArr = [quizDictionary[counter].correctAnswer,
                         quizDictionary[counter].incorrectAnswers[0],
                         quizDictionary[counter].incorrectAnswers[1],
                         quizDictionary[counter].incorrectAnswers[2]]
        
        let randomNumber = Int.random(in: 0...(answerArr.count - 1))
        var randomNumber2 = Int.random(in: 0...(answerArr.count - 1))
        var randomNumber3 = Int.random(in: 0...(answerArr.count - 1))
        var randomNumber4 = Int.random(in: 0...(answerArr.count - 1))
        
        
        
        firstChoiceButton.setTitle("\(answerArr[randomNumber]?.removingPercentEncoding ?? "Missing answer")", for: .normal)
        firstChoiceButton.titleLabel?.adjustsFontSizeToFitWidth = true
        while randomNumber == randomNumber2 {
            randomNumber2 = Int.random(in: 0...(answerArr.count - 1))
        }
        secondChoiceButton.setTitle("\(answerArr[randomNumber2]?.removingPercentEncoding ?? "Missing answer")", for: .normal)
        secondChoiceButton.titleLabel?.adjustsFontSizeToFitWidth = true

        while randomNumber3 == randomNumber2 || randomNumber3 == randomNumber {
            randomNumber3 = Int.random(in: 0...(answerArr.count - 1))
        }
        thirdChoiceButton.setTitle("\(answerArr[randomNumber3]?.removingPercentEncoding ?? "Missing answer")", for: .normal)
        thirdChoiceButton.titleLabel?.adjustsFontSizeToFitWidth = true

        while randomNumber4 == randomNumber3 || randomNumber4 == randomNumber2 || randomNumber4 == randomNumber {
            randomNumber4 = Int.random(in: 0...(answerArr.count - 1))
        }
        fourthChoiceButton.setTitle("\(answerArr[randomNumber4]?.removingPercentEncoding ?? "Missing answer")", for: .normal)
        fourthChoiceButton.titleLabel?.adjustsFontSizeToFitWidth = true

        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Finished" {
            let destinationVC = segue.destination as! ViewController
            destinationVC.score = score
        }
    }
    
    
    @IBAction func exitButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "Back", sender: nil)
    }
    
    @IBAction func trueButtonClicked(_ sender: Any) {
                
        if quizDictionary[counter].correctAnswer == "True" {
            score += 1
            self.scoreLabel.text = "Score: \(score)"
        }
        nextQuestion()
    }
    
    @IBAction func falseButtonClicked(_ sender: Any) {
        if quizDictionary[counter].correctAnswer == "False" {
            score += 1
            self.scoreLabel.text = "Score: \(score)"

        }
        nextQuestion()
    }

    @IBAction func firstChoiceClicked(_ sender: Any) {
        if firstChoiceButton.currentTitle == correctAnswer.removingPercentEncoding {
            score += 1
            self.scoreLabel.text = "Score: \(score)"
        }
        nextQuestion()
    }
    @IBAction func secondChoiceClicked(_ sender: Any) {
        if secondChoiceButton.currentTitle == correctAnswer.removingPercentEncoding {
            score += 1
            self.scoreLabel.text = "Score: \(score)"
        }
        nextQuestion()
    }
    @IBAction func thirdChoiceClicked(_ sender: Any) {
        if thirdChoiceButton.currentTitle == correctAnswer.removingPercentEncoding {
            score += 1
            self.scoreLabel.text = "Score: \(score)"
        }
        nextQuestion()
    }
    @IBAction func fourthChoiceClicked(_ sender: Any) {
        if fourthChoiceButton.currentTitle == correctAnswer.removingPercentEncoding {
            score += 1
            self.scoreLabel.text = "Score: \(score)"
        }
        nextQuestion()
    }
    
   
    
}
