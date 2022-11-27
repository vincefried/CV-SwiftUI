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
    
    init(person: Person) {
        self.profileInfo = ProfileInfo(person: person)
        self.imageName = person.imageName
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
                    formattedBirthday,
                    person.nationality,
                ]
            )
            
            let formattedCity = "\(person.address.zip) \(person.address.city), \(person.address.country)"
            let addressItem = GridItem(
                id: .address,
                iconName: "house",
                texts: [
                    person.address.street,
                    formattedCity,
                ]
            )
            
            let formattedWebsite = person.contactInfo.website.relativeString.replacingOccurrences(of: "https://www.", with: "")
            let contactInfoItem = GridItem(
                id: .contact,
                iconName: "envelope",
                texts: [
                    person.contactInfo.telephoneNumber,
                    person.contactInfo.email,
                    formattedWebsite,
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
        }
        
        let id: Kind
        let iconName: String
        let texts: [String]
    }
}
