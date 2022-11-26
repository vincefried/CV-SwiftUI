//
//  Person+Example.swift
//  CV
//
//  Created by Vincent Friedrich on 25.11.22.
//

import Foundation

extension Person {
    static let example = Person(
        name: "Vincent Felix Friedrich",
        role: "iOS Developer",
        imageName: "profile",
        birthday: Date(),
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
                companyName: "Parship",
                startDate: Date(),
                endDate: nil,
                role: "iOS Developer",
                programmingLanguages: [.swift],
                info: [
                    "Developed the Parship, ElitePartner and eharmony native iOS Apps",
                ]
            ),
            Job(
                companyName: "For Sale Mobile",
                startDate: Date() - 23293480,
                endDate: Date() - 2329348,
                role: "App Developer",
                programmingLanguages: [.swift, .cSharp],
                info: [
                    "Developed fridge IoT app „SmartDevice“ for Liebherr Hausgeräte (Xamarin, MVVM pattern)",
                ]
            ),
            Job(
                companyName: "For Sale Mobile",
                startDate: Date() - 23293700,
                endDate: Date() - 23293500,
                role: "Working Student App Developer",
                programmingLanguages: [.swift, .objC, .cSharp],
                info: [
                    "Developed fridge IoT app „SmartDevice“ for Liebherr Hausgeräte (Xamarin, MVVM pattern)",
                    "Developed fridge IoT app „SmartDevice“ for Liebherr Hausgeräte (Xamarin, MVVM pattern)",
                ]
            ),
            Job(
                companyName: "Justcom",
                startDate: Date() - 23293800,
                endDate: Date() - 23293900,
                role: "Working Student App Developer",
                programmingLanguages: [.swift, .objC, .cSharp],
                info: [
                    "Developed fridge IoT app „SmartDevice“ for Liebherr Hausgeräte (Xamarin, MVVM pattern)",
                ]
            ),
        ],
        educationalBackground: [
            Education(
                institutionName: "HAW Hamburg",
                city: "Hamburg",
                startDate: Date() - 232932000,
                endDate: Date() - 232931000,
                seekedDegree: .bachelor(
                    graduation: .init(
                        topicOfFinalThesis: """
                        Topic of bachelor thesis: „Design and Implementation of a native iOS App that exchanges Messages using innovative Features“. Grade: 1.0.
                        """,
                        gradeOfFinalThesis: 1.0,
                        finalGrade: 2.6
                    )
                ),
                programOfStudy: "Media Systems"
            ),
            Education(
                institutionName: "FH Wedel",
                city: "Schleswig-Holstein",
                startDate: Date() - 232934000,
                endDate: Date() - 232933000,
                seekedDegree: .bachelor(graduation: .none),
                programOfStudy: "Media Systems"
            ),
            Education(
                institutionName: "Gymnasium Lerchenfeld",
                city: "Hamburg",
                startDate: Date() - 232936000,
                endDate: Date() - 232935000,
                seekedDegree: .abitur(graduation: .init(finalGrade: 2.6)),
                programOfStudy: nil
            )
        ],
        skills: [
            [
                PercentageSkill(name: "Swift", relativeExperience: 1.0),
                PercentageSkill(name: "Obj-C", relativeExperience: 0.5),
                PercentageSkill(name: "Java", relativeExperience: 0.5),
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
                BasicSkill(name: "MVVM"),
            ]
        ]
    )
}
