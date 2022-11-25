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
        )
    )
}
