//
//  QuestionsViewController.swift
//  ClaseDelCurso
//
//  Created by Usuario invitado on 7/11/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    var questions: [Question] = [Question(text: "Which food do you like the most?", type: .single, answers: [Answer(text: "Eucalyptus", type: .koala), Answer(text: "Steak", type: .tiger), Answer(text: "Insects", type: .frog), Answer(text: "Bamboo", type: .panda)]), ]
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

    }

    

}
