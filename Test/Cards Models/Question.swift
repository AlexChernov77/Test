//
//  Question.swift
//  Test
//
//  Created by Александр Чернов on 23.04.2018.
//  Copyright © 2018 Александр Чернов. All rights reserved.
//

import Foundation


class Question
{
    let question: String
    let answers: [Answer]
    let selectedChoice: Bool
    
    
    init( question: String, answers: [Answer], selectedChoice: Bool)
    {
        self.question = question
        self.answers = answers
        self.selectedChoice = selectedChoice
    }
}
