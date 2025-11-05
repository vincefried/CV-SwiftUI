//
//  Person+Example.swift
//  CV
//
//  Created by Vincent Friedrich on 25.11.22.
//

import Foundation

extension Person {
    static let me = Person(
        name: "Vincent Felix Friedrich",
        gender: .male,
        role: "Senior iOS Developer",
        imageName: "profile",
        birthday: Date.from(day: 26, month: 10, year: 1994)!,
        nationality: "German",
        address: Address(
            street: "Apensener Str. 112i",
            zip: "21614",
            city: "Buxtehude",
            country: "Germany"
        ),
        contactInfo: ContactInfo(
            telephoneNumber: "+49 160 90385431",
            email: "info@vincentfriedrich.com",
            website: URL(string: "https://www.vincentfriedrich.com")!
        ),
        jobs: [
            Job(
                companyName: "Reydix",
                startDate: Date.from(day: 1, month: 7, year: 2025)!,
                endDate: nil,
                role: "Squad Lead",
                programmingLanguages: [.swift],
                info: [
                    "Non-disciplinary leadership of one of three teams, focussed on user engagement",
                    "In parallel, keeping previous iOS responsibilities with fewer time allocation",
                    "Building up and optimizing processes and a team structure in a startup environment",
                    "Technical requirements engineering across multiple platforms (Backend, iOS & Android)",
                    "Planning of upcoming features in collaboration with product, design and other stakeholders",
                    "Mentoring team members",
                    "Holding job interviews",
                ]
            ),
            Job(
                companyName: "Reydix",
                startDate: Date.from(day: 15, month: 5, year: 2024)!,
                endDate: Date.from(day: 30, month: 6, year: 2025)!,
                role: "Senior iOS Developer",
                programmingLanguages: [.swift],
                info: [
                    "Technical leadership of the Reydix B2C and B2B native iOS Apps",
                    "Building scalable solutions for topics including navigation in a pure SwiftUI app",
                    "Helping build up a well-structured, tested and monitored project",
                    "Contributing to manifesting an open and appreciative working culture",
                    "Sharing knowledge and mentoring other iOS developers",
                    "Holding job interviews",
                ]
            ),
            Job(
                companyName: "FREENOW",
                startDate: Date.from(day: 1, month: 12, year: 2023)!,
                endDate: Date.from(day: 20, month: 4, year: 2024)!,
                role: "Senior iOS Engineer",
                programmingLanguages: [.swift, .objC],
                info: [
                    "Developed the FREENOW native iOS App for drivers",
                    "Modularized features using SPM in tandem with Tuist",
                    "Contributed to knowledge sharing sessions",
                ]
            ),
            Job(
                companyName: "Quartett Mobile",
                startDate: Date.from(day: 3, month: 8, year: 2023)!,
                endDate: Date.from(day: 30, month: 11, year: 2023)!,
                role: "iOS Developer",
                programmingLanguages: [.swift],
                info: [
                    "Developed the myAudi native iOS App",
                    "Worked with SAFe",
                ]
            ),
            Job(
                companyName: "Parship Group",
                startDate: Date.from(day: 1, month: 8, year: 2020)!,
                endDate: Date.from(day: 31, month: 7, year: 2023)!,
                role: "iOS Developer",
                programmingLanguages: [.swift],
                info: [
                    "Developed the Parship, ElitePartner and eharmony native iOS Apps",
                    "Modularized features using Swift Package Manager",
                    "Proactively pushed topics including advances in architecture, the integration of SwiftUI and the reimplementation of the messenger",
                    "Organized internal events (hackathon, team event)",
                    "Held job interviews",
                ]
            ),
            Job(
                companyName: "For Sale Mobile",
                startDate: Date.from(day: 1, month: 8, year: 2019)!,
                endDate: Date.from(day: 31, month: 7, year: 2020)!,
                role: "App Developer",
                programmingLanguages: [.swift, .cSharp],
                info: [
                    "Developed multiple native iOS and cross platform apps for Liebherr Hausgeräte, Volvo Trucks and other clients as working student and later as full time employee.",
                ]
            ),
            Job(
                companyName: "For Sale Mobile",
                startDate: Date.from(day: 1, month: 6, year: 2015)!,
                endDate: Date.from(day: 31, month: 7, year: 2019)!,
                role: "Working Student App Developer",
                programmingLanguages: [.swift, .objC, .cSharp],
                info: []
            ),
        ],
        educationalBackground: [
            Education(
                institutionName: "HAW Hamburg",
                city: "Hamburg",
                startDate: Date.from(month: 9, year: 2016)!,
                endDate: Date.from(month: 8, year: 2019)!,
                seekedDegree: .bachelor(
                    graduation: .init(
                        topicOfFinalThesis: """
                        Design and Implementation of a native iOS App that exchanges Messages using innovative Features
                        """,
                        gradeOfFinalThesis: 1.0,
                        finalGrade: 2.0
                    )
                ),
                programOfStudy: "Media Systems"
            ),
            Education(
                institutionName: "FH Wedel",
                city: "Schleswig-Holstein",
                startDate: Date.from(month: 4, year: 2014)!,
                endDate: Date.from(month: 8, year: 2016)!,
                seekedDegree: .bachelor(graduation: .none),
                programOfStudy: "Media Computer Science"
            ),
            Education(
                institutionName: "Gymnasium Lerchenfeld",
                city: "Hamburg",
                startDate: Date.from(month: 8, year: 2005)!,
                endDate: Date.from(month: 6, year: 2013)!,
                seekedDegree: .abitur(graduation: .init(finalGrade: 2.6)),
                programOfStudy: nil
            ),
        ],
        skills: [
            [
                PercentageSkill(name: "Swift", relativeExperience: 0.90),
                PercentageSkill(name: "Obj-C", relativeExperience: 0.25),
            ],
            [
                PercentageSkill(name: "German (native language)", relativeExperience: 1.0),
                PercentageSkill(name: "English", relativeExperience: 0.8),
            ],
            [
                BasicSkill(name: "SwiftUI"),
                BasicSkill(name: "MVVM"),
                BasicSkill(name: "Swift Concurrency"),
                BasicSkill(name: "Combine"),
                BasicSkill(name: "UIKit"),
                BasicSkill(name: "VIP"),
                BasicSkill(name: "VIPER"),
                BasicSkill(name: "TCA"),
                BasicSkill(name: "Unit testing"),
                BasicSkill(name: "Clean Code"),
                BasicSkill(name: "CocoaPods"),
                BasicSkill(name: "SPM"),
                BasicSkill(name: "fastlane"),
                BasicSkill(name: "Logic Pro"),
                BasicSkill(name: "Adobe Creative Cloud"),
                BasicSkill(name: "Sketch"),
            ],
        ],
        trainings: [
            Training(
                name: "An introduction to Swift Concurrency",
                date: Date.from(year: 2023)!,
                info: [
                    "Workshop by Donny Wals"
                ]
            ),
            Training(
                name: "NSSpain X",
                date: Date.from(year: 2022)!,
                info: []
            ),
            Training(
                name: "Interviewtraining",
                date: Date.from(year: 2021)!,
                info: [
                    "by Katja Loose, Excellence in Talents"
                ]
            ),
        ],
        interests: [
            Interest("Music Production"),
            Interest("Apple"),
            Interest("Songwriting"),
            Interest("Singing"),
            Interest("Guitars"),
            Interest("Coding"),
            Interest("Cars"),
            Interest("Golf"),
            Interest("Aviation"),
        ],
        talks: [
            Talk(
                title: "From MVVM to VIP - Evolution of the Parship iOS App",
                date: Date.from(day: 1, month: 6, year: 2023)!,
                info: [
                    "CocoaHeads Hamburg"
                ]
            )
        ]
    )
}
