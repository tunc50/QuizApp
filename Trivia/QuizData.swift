//
//  QuizData.swift
//  Trivia
//
//  Created by Kuka on 18.08.2021.
//

import Foundation


class QuizData: Codable {
    var responseCode: Int = 0
    var results : [Result]
    
    //Copy Pasted stuff
    enum CodingKeys: String, CodingKey {
                   case responseCode = "response_code"
                   case results = "results"
           }
       
    required init(from decoder: Decoder) throws {
                   let values = try decoder.container(keyedBy: CodingKeys.self)
            responseCode = try values.decodeIfPresent(Int.self, forKey: .responseCode)!
            results = try values.decodeIfPresent([Result].self, forKey: .results)!
           }
}

class Result: Codable {

        var category : String!
        var correctAnswer : String!
        var difficulty : String!
        var incorrectAnswers : [String]!
        var question : String!
        var type : String?
        
    
   
    
    //Copy Pasted stuff
    enum CodingKeys: String, CodingKey {
                    case category = "category"
                    case correctAnswer = "correct_answer"
                    case difficulty = "difficulty"
                    case incorrectAnswers = "incorrect_answers"
                    case question = "question"
                    case type = "type"
            }
        
    required init(from decoder: Decoder) throws {
                    let values = try decoder.container(keyedBy: CodingKeys.self)
                    category = try values.decodeIfPresent(String.self, forKey: .category)
                    correctAnswer = try values.decodeIfPresent(String.self, forKey: .correctAnswer)
                    difficulty = try values.decodeIfPresent(String.self, forKey: .difficulty)
                    incorrectAnswers = try values.decodeIfPresent([String].self, forKey: .incorrectAnswers)
                    question = try values.decodeIfPresent(String.self, forKey: .question)
                    type = try values.decodeIfPresent(String.self, forKey: .type)
                
            }
}
