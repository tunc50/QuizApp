//
//  APICaller.swift
//  Trivia
//
//  Created by Kuka on 18.08.2021.
//

import Foundation

func APICaller(amount: Int, difficulty: String) {
    
   
    
      let url = URL(string: "https://opentdb.com/api.php?amount=\(amount)&difficulty=\(difficulty)&encode=url3986")!
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let session = URLSession.shared
    let task = session.dataTask(with: url) { data, response, error in
        if error == nil && data != nil {
            do{
            
                let dictionary =  try JSONDecoder().decode(QuizData.self, from: data!)
            
                
                quizDictionary = dictionary.results
                
            
        
               
                
            } catch {
                print("Error JSONDecoder")
            }
        } else {
            print("Error creating task")
        }
        
    }
    task.resume()
   

}

extension String {
    func decodeUrl() -> String?
        {
            return self.removingPercentEncoding
        }
}


