//
//  Education.swift
//  CV
//
//  Created by Vincent Friedrich on 26.11.22.
//

import Foundation

protocol Graduation {
    var finalGrade: Float { get }
}

struct Education: PeriodOfLife {
    enum Degree {
        case abitur(graduation: SchoolGraduation), bachelor(graduation: UniversityGraduation?)

        struct SchoolGraduation: Graduation {
            let finalGrade: Float
        }

        struct UniversityGraduation: Graduation {
            let topicOfFinalThesis: String
            let gradeOfFinalThesis: Float
            let finalGrade: Float
        }
    }

    let institutionName: String
    let city: String
    let startDate: Date
    let endDate: Date?
    let seekedDegree: Degree
    let programOfStudy: String?
}
