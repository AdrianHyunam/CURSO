//
//  QuestionsViewController.swift
//  ClaseDelCurso
//
//  Created by Usuario invitado on 7/11/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButon1: UIButton!
    @IBOutlet weak var singleButon2: UIButton!
    @IBOutlet weak var singleButon3: UIButton!
    @IBOutlet weak var singleButon4: UIButton!

    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multiLabel4: UILabel!
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!
    
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    @IBOutlet weak var rangedSlider: UISlider!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    var questions: [Question] = [Question(text: "Which food do you like the most?", type: .single, answers: [Answer(text: "Eucalyptus", type: .koala), Answer(text: "Steak", type: .tiger), Answer(text: "Insects", type: .frog), Answer(text: "Bamboo", type: .panda)]), Question(text: "Wich activities do you enjoy?", type: .multiple, answers: [Answer(text: "Sleeping", type: .koala), Answer(text: "Running", type: .tiger), Answer(text: "Swimming", type: .frog), Answer(text: "Eating", type: .panda)]), Question(text: "How much do you enjoy car rides?", type: .ranged, answers: [Answer(text: "I dislike them", type: .koala), Answer(text: "I get a little nervous", type: .tiger), Answer(text: "I barely notice them", type: .frog), Answer(text: "I love more being at home eating", type: .panda)])]
    var questionIndex = 0
    var answersChosen: [Answer] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

    }
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton)
    {
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
        case singleButon1:
            answersChosen.append(currentAnswers[0])
        case singleButon2:
            answersChosen.append(currentAnswers[1])
        case singleButon3:
            answersChosen.append(currentAnswers[2])
        case singleButon4:
            answersChosen.append(currentAnswers[3])
        default:
            break
        }
        
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtomPressed()
    {
       let currentAnswers = questions[questionIndex].answers
        
        if multiSwitch1.isOn
        {
            answersChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn
        {
            answersChosen.append(currentAnswers[1])
        }
        if multiSwitch3.isOn
        {
            answersChosen.append(currentAnswers[2])
        }
        if multiSwitch4.isOn
        {
            answersChosen.append(currentAnswers[3])
        }
        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtomPressed()
    {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        answersChosen.append(currentAnswers[index])
        
        nextQuestion()
    }
    
    func nextQuestion()
    {
        questionIndex += 1
        
        if questionIndex < questions.count
        {
            updateUI()
        }
        else
        {
            performSegue(withIdentifier: "resultsSegue", sender: nil)
        }
    }
    
    func updateUI()
    {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
    
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex+1)"
        questionLabel.text = currentQuestion.text
    questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type
        {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        }
    }
    
    func updateSingleStack(using answers: [Answer])
    {
        singleStackView.isHidden = false
        singleButon1.setTitle(answers[0].text, for: .normal)
        singleButon2.setTitle(answers[1].text, for: .normal)
        singleButon3.setTitle(answers[2].text, for: .normal)
        singleButon4.setTitle(answers[3].text, for: .normal)
    }
    
    func updateMultipleStack(using answers: [Answer])
    {
        multipleStackView.isHidden = false
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
    }
    
    func updateRangedStack(using answers: [Answer])
    {
        rangedStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: false)
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultsSegue"
        {
            let resultsViewController = segue.destination as! ResultsViewController
            resultsViewController.responses = answersChosen
        }
    }

    

}
