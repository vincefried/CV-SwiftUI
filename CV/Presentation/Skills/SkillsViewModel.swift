//
//  SkillsViewModel.swift
//  CV
//
//  Created by Vincent Friedrich on 26.11.22.
//

import Foundation

struct SkillsViewModel {
    let title: String
    let percentageSkills: [Percentage]
    let basicSkills: Basic

    init(skills: [[Skill]]) {
        self.title = "Skills"
        let percentageSkills = skills.compactMap { $0 as? [PercentageSkill] }
        self.percentageSkills = percentageSkills.map(Percentage.init)
        let basicSkills = skills.compactMap { $0 as? [BasicSkill] }.flatMap { $0 }
        self.basicSkills = Basic(skills: basicSkills)
    }
}

extension SkillsViewModel {
    struct Percentage: Identifiable {
        let id: String
        let items: [Item]

        init(skills: [PercentageSkill]) {
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

extension SkillsViewModel {
    struct Basic {
        let items: [Item]

        init(skills: [BasicSkill]) {
            self.items = skills.map { skill in
                Item(name: skill.name)
            }
        }
    }
}

extension SkillsViewModel.Basic {
    struct Item {
        let name: String
    }
}
