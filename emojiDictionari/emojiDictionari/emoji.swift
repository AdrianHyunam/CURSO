//
//  emoji.swift
//  emojiDictionari
//
//  Created by macbook on 11/14/18.
//  Copyright © 2018 TitiBass. All rights reserved.
//

import Foundation

class Emoji
{
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    init(symbol: String, name: String, description: String, usage: String)
    {
        self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
    }
}
