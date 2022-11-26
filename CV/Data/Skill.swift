//
//  Skill.swift
//  CV
//
//  Created by Vincent Friedrich on 26.11.22.
//

import Foundation

protocol Skill {
    var name: String { get }
}

struct BasicSkill: Skill {
    let name: String
}

struct PercentageSkill: Skill {
    let name: String
    let relativeExperience: Float
}
