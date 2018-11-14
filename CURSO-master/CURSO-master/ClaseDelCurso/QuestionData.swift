//
//  QuestionData.swift
//  ClaseDelCurso
//
//  Created by Macbook on 11/12/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType
{
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: AnimalType
}

enum AnimalType: Character
{
    case koala = "🐨", tiger = "🐯", frog = "🐸", panda = "🐼"
    
    var definition: String
    {
        switch self {
        case .koala:
            return "You are a person who enjoys sleeping during the day and going out at night, you are shy but for many you are someone cool."
        case .tiger:
            return "You are a person who enjoys challenges, daring and effective. You are simply one of those who do things and do not stay with the desire of what you see."
        case .frog:
            return "You are a person who walks from here for there, never quiet, you like to swim and you do not like very hot climates."
        case .panda:
            return "You are a person who loves to sleep regardless of the time and do not say eat, you love more to eat than your partner, you generate tenderness in the people who frequent you and do not like to exercise."
        }
    }
}

