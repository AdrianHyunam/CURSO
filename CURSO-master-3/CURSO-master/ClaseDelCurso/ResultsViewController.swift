//
//  ResultsViewController.swift
//  ClaseDelCurso
//
//  Created by Usuario invitado on 7/11/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var descriptionAnswerLabel: UILabel!
    @IBOutlet weak var resultAnswerLabel: UILabel!
    
    var responses: [Answer]!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
        
    }

    func calculatePersonalityResult()
    {
        var frequencyOfAnswers: [AnimalType: Int] = [:]
        let responseTypes = responses.map { $0.type }
        let frequentAnswerSorted = frequencyOfAnswers.sorted(by: { (pair1, pair2) -> Bool in return pair1.value > pair2.value})
        let mostCommonAnswer = frequentAnswerSorted.first!.key
  
        for response in responseTypes
        {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
        
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        descriptionAnswerLabel.text = mostCommonAnswer.definition
        
    }


}
