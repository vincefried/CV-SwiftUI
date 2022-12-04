//
//  HeaderViewModel.swift
//  CV
//
//  Created by Vincent Friedrich on 25.11.22.
//

import Foundation

struct HeaderViewModel {
    let profileInfo: HeaderViewModel.ProfileInfo
    let imageName: String
    let imageDescription: String
    
    init(person: Person) {
        self.profileInfo = ProfileInfo(person: person)
        self.imageName = person.imageName
        self.imageDescription = "Portrait photo of a \(person.gender.localized) person."
    }
}

extension Person.Gender {
    fileprivate var localized: String {
        switch self {
        case .male:
            return "male"
        case .female:
            return "female"
        case .nonbinary:
            return "nonbinary"
        }
    }
}

extension HeaderViewModel {
    struct ProfileInfo {
        let title: String
        let subtitle: String
        let gridItems: [GridItem]
        
        init(person: Person) {
            self.title = person.name
            self.subtitle = person.role
            self.gridItems = Self.makeGridItems(for: person)
        }
        
        private static func makeGridItems(for person: Person) -> [GridItem] {
            let birthdayDateFormatter = DateFormatter()
            birthdayDateFormatter.dateStyle = .long
            
            let formattedBirthday = birthdayDateFormatter.string(from: person.birthday)
            let basicInfoItem = GridItem(
                id: .basic,
                iconName: "person",
                texts: [
                    (content: formattedBirthday, contentDescription: "Birthday"),
                    (content: person.nationality, contentDescription: "Nationality"),
                ]
            )
            
            let formattedCity = "\(person.address.zip) \(person.address.city), \(person.address.country)"
            let addressItem = GridItem(
                id: .address,
                iconName: "house",
                texts: [
                    (content: person.address.street, contentDescription: "Address"),
                    (content: formattedCity, contentDescription: nil),
                ]
            )
            
            let formattedWebsite = person.contactInfo.website.relativeString.replacingOccurrences(of: "https://www.", with: "")
            let contactInfoItem = GridItem(
                id: .contact,
                iconName: "envelope",
                texts: [
                    (content: person.contactInfo.telephoneNumber, contentDescription: "Phone"),
                    (content: person.contactInfo.email, contentDescription: "Email"),
                    (content: formattedWebsite, contentDescription: "Website"),
                ]
            )
            
            let gridItems = [
                basicInfoItem,
                addressItem,
                contactInfoItem,
            ]
            return gridItems
        }
    }
}

extension HeaderViewModel.ProfileInfo {
    struct GridItem: Identifiable {
        enum Kind {
            case basic
            case address
            case contact

            var localized: String {
                switch self {
                case .basic:
                    return "Basic information"
                case .address:
                    return "Address"
                case .contact:
                    return "Contact information"
                }
            }
        }
        
        let id: Kind
        let iconName: String
        let texts: [(content: String, contentDescription: String?)]
    }
}
