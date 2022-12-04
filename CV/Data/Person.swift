//
//  Person.swift
//  CV
//
//  Created by Vincent Friedrich on 25.11.22.
//

import Foundation

struct Person {
    let name: String
    let gender: Gender
    let role: String
    let imageName: String
    let birthday: Date
    let nationality: String
    let address: Address
    let contactInfo: ContactInfo
    let jobs: [Job]
    let educationalBackground: [Education]
    let skills: [[Skill]]
    let trainings: [Training]
    let interests: [Interest]
}

extension Person {
    struct Address {
        let street: String
        let zip: String
        let city: String
        let country: String
    }
}

extension Person {
    struct ContactInfo {
        let telephoneNumber: String
        let email: String
        let website: URL
    }
}

extension Person {
    enum Gender {
        case male, female, nonbinary
    }
}
