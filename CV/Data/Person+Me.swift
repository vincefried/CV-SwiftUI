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
            email: "vincefried@web.de",
            website: URL(string: "https://www.vincent-friedrich.de")!
        ),
        jobs: [
            Job(
                companyName: "FREENOW",
                startDate: Date.from(day: 1, month: 12, year: 2023)!,
                endDate: nil,
                role: "Senior iOS Engineer",
                programmingLanguages: [.swift, .objC],
                info: [
                    "Developed the FREENOW native iOS App for drivers",
                    "Implemented features using Redux pattern",
                    "Modularized features using SPM in tandem with Tuist",
                    "Contributed to knowledge sharing sessions",
                    "Maintained the CI pipeline with fastlane and GitLab",
                    "Organized CocoaHeads iOS Meetup at FREENOW in Hamburg",
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
                    "Implemented features in MVVM pattern",
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
                    "Implemented features in MVVM+C pattern",
                    "Modularized features using Swift Package Manager",
                    "Proactively pushed topics including advances in architecture, the integration of SwiftUI and the reimplementation of the messenger",
                    "Maintained the CI pipeline with fastlane and GitHub Actions",
                    "Organized internal events (hackathon, team event)",
                    "Organized CocoaHeads iOS Meetup at Parship in Hamburg",
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
                    "Developed fridge IoT app „SmartDevice“ for Liebherr Hausgeräte (Xamarin, MVVM pattern)",
                    "Developed service contract management app for Volvo Trucks (iOS, VIP pattern)",
                    "Developed smart shopping list „HNGRY“ (iOS, VIPER pattern)",
                    "Designed and implemented UI concepts for multiple apps using Sketch",
                    "Maintained internal server structure and CI pipeline",
                ]
            ),
            Job(
                companyName: "For Sale Mobile",
                startDate: Date.from(day: 1, month: 6, year: 2015)!,
                endDate: Date.from(day: 31, month: 7, year: 2019)!,
                role: "Working Student App Developer",
                programmingLanguages: [.swift, .objC, .cSharp],
                info: [
                    "Developed fridge IoT app „SmartDevice“ for Liebherr Hausgeräte (Xamarin, MVVM pattern)",
                    "Developed service contract management app for Volvo Trucks (iOS, VIP pattern)",
                    "Developed „Icecrusher“ marketing app for Liebherr Hausgeräte (iOS & Android / Unity hybrid)",
                    "Developed „Biofresh“ marketing app for Liebherr Hausgeräte (iOS & Android)",
                    "Designed and implemented UI concepts for multiple apps using Sketch",
                    "Maintained internal server structure and CI pipeline",
                ]
            ),
            Job(
                companyName: "EOS Uptrade",
                startDate: Date.from(month: 2, year: 2014)!,
                endDate: Date.from(month: 2, year: 2014)!,
                role: "Trainee iOS / Android Developer",
                programmingLanguages: [.objC, .java],
                info: []
            ),
            Job(
                companyName: "EOS Uptrade",
                startDate: Date.from(month: 10, year: 2013)!,
                endDate: Date.from(month: 10, year: 2013)!,
                role: "Trainee iOS Developer",
                programmingLanguages: [.objC],
                info: []
            ),
            Job(
                companyName: "Justcom",
                startDate: Date.from(month: 9, year: 2013)!,
                endDate: Date.from(month: 2, year: 2014)!,
                role: "Sidejob Customer Service",
                programmingLanguages: [],
                info: [
                    "Telephone support",
                    "Maintained online shop",
                ]
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
                PercentageSkill(name: "Swift", relativeExperience: 0.95),
                PercentageSkill(name: "Obj-C", relativeExperience: 0.5),
                PercentageSkill(name: "C#", relativeExperience: 0.2),
                PercentageSkill(name: "Java", relativeExperience: 0.2),
                PercentageSkill(name: "C", relativeExperience: 0.2),
            ],
            [
                PercentageSkill(name: "German (native language)", relativeExperience: 1.0),
                PercentageSkill(name: "English", relativeExperience: 0.8),
            ],
            [
                BasicSkill(name: "SwiftUI"),
                BasicSkill(name: "UIKit"),
                BasicSkill(name: "VIP"),
                BasicSkill(name: "VIPER"),
                BasicSkill(name: "Combine"),
                BasicSkill(name: "MVVM"),
                BasicSkill(name: "TCA"),
                BasicSkill(name: "Unit testing"),
                BasicSkill(name: "Clean Code"),
                BasicSkill(name: "CocoaPods"),
                BasicSkill(name: "SPM"),
                BasicSkill(name: "ARKit"),
                BasicSkill(name: "fastlane"),
                BasicSkill(name: "Logic Pro"),
                BasicSkill(name: "Final Cut Pro"),
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
            Training(
                name: "NSSpain",
                date: Date.from(year: 2020)!,
                info: []
            ),
        ],
        interests: [
            Interest("Music Production"),
            Interest("Apple"),
            Interest("Songwriting"),
            Interest("Singing"),
            Interest("Guitars"),
            Interest("Coding"),
            Interest("Film production"),
            Interest("Cars"),
            Interest("Badminton"),
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
