//
//  TagView.swift
//  CV
//
//  Created by Vincent Friedrich on 26.11.22.
//

import SwiftUI

struct TagView: View {
    let items: [String]

    var body: some View {
        FlowLayout(alignment: .leading, spacing: .cvSemiSmallSpacing) {
            ForEach(items, id: \.self) { item in
                Item(title: item)
            }
        }
    }

    private struct Item: View {
        let title: String

        var body: some View {
            Text(title)
                .padding([.leading, .trailing], .cvSemiSmallSpacing)
                .padding([.top, .bottom], .cvSmallSpacing)
                .font(.cvSemiLargeProminent)
                .foregroundStyle(Color.cvPrimary)
                .overlay(
                    Capsule()
                        .stroke(Color.cvTertiary.opacity(0.3))
                )
        }
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(items: Person.me.interests)
            .frame(width: 330)
            .previewLayout(.sizeThatFits)
    }
}
