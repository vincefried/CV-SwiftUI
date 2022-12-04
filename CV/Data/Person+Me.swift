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
        role: "iOS Developer",
        imageName: "profile",
        birthday: Date.from(day: 26, month: 10, year: 1994)!,
        nationality: "German",
        address: Address(
            street: "Bromberger Str. 37",
            zip: "21629",
            city: "Neu Wulmstorf",
            country: "Germany"
        ),
        contactInfo: ContactInfo(
            telephoneNumber: "+49 160 90385431",
            email: "vincefried@web.de",
            website: URL(string: "https://www.vincent-friedrich.de")!
        ),
        jobs: [
            Job(
                companyName: "Parship Group",
                startDate: Date.from(day: 1, month: 8, year: 2020)!,
                endDate: nil,
                role: "iOS Developer",
                programmingLanguages: [.swift],
                info: [
                    "Developed the Parship, ElitePartner and eharmony native iOS Apps",
                    "Implemented features in MVVM+C pattern",
                    "Modularized features using Swift Package Manager",
                    "Proactively pushed topics including advances in architecture, the integration of SwiftUI and the reimplementation of the messenger",
                    "Maintained the CI pipeline with fastlane and GitHub Actions",
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
                PercentageSkill(name: "Swift", relativeExperience: 1.0),
                PercentageSkill(name: "Obj-C", relativeExperience: 0.5),
                PercentageSkill(name: "C#", relativeExperience: 0.4),
                PercentageSkill(name: "Java", relativeExperience: 0.4),
                PercentageSkill(name: "C", relativeExperience: 0.2),
            ],
            [
                PercentageSkill(name: "German (native language)", relativeExperience: 1.0),
                PercentageSkill(name: "English", relativeExperience: 0.8),
            ],
            [
                BasicSkill(name: "UIKit"),
                BasicSkill(name: "SwiftUI"),
                BasicSkill(name: "VIP"),
                BasicSkill(name: "VIPER"),
                BasicSkill(name: "CocoaPods"),
                BasicSkill(name: "MVVM"),
                BasicSkill(name: "fastlane"),
                BasicSkill(name: "Logic Pro"),
                BasicSkill(name: "Adobe Creative Cloud"),
                BasicSkill(name: "SPM"),
                BasicSkill(name: "Final Cut Pro"),
                BasicSkill(name: "Combine"),
                BasicSkill(name: "Unit testing"),
                BasicSkill(name: "ARKit"),
                BasicSkill(name: "GRDB"),
                BasicSkill(name: "Sketch"),
            ],
        ],
        trainings: [
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
            Interest("Film production"),
            Interest("Cars"),
            Interest("Coding"),
            Interest("Badminton"),
            Interest("Aviation"),
            Interest("Guitars"),
        ]
    )
}
