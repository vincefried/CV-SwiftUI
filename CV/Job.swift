//
//  Job.swift
//  CV
//
//  Created by Vincent Friedrich on 25.11.22.
//

import Foundation

struct Job {
    let companyName: String
    let startDate: Date
    let endDate: Date?
    let role: String
    let programmingLanguages: [ProgrammingLanguage]
    let info: [String]
}
