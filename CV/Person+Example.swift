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
        ]
    )
}
