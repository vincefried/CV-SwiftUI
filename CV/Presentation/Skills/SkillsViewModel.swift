//
//  SkillsViewModel.swift
//  CV
//
//  Created by Vincent Friedrich on 26.11.22.
//

import Foundation

final class SkillsViewModel {
    let title: String
    let percentageSkills: [Percentage]

    init(skills: [[Skill]]) {
        self.title = "Skills"
        self.percentageSkills = skills.map(Percentage.init)
    }
}

extension SkillsViewModel {
    struct Percentage: Identifiable {
        let id: String
        let items: [Item]

        init(skills: [Skill]) {
            self.id = UUID().uuidString
            self.items = skills.map { skill in
                Item(
                    id: UUID().uuidString,
                    name: skill.name,
                    percentCompleted: skill.relativeExperience
                )
            }
        }
    }
}

extension SkillsViewModel.Percentage {
    struct Item: Identifiable {
        let id: String
        let name: String
        let percentCompleted: Float
    }
}
