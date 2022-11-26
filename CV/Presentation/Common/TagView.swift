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
        FlowLayout(horizontalSpacing: .cvSemiSmallSpacing, verticalSpacing: .cvSemiSmallSpacing) {
            ForEach(items, id: \.self) { item in
                Item(title: item)
            }
        }
    }

    private struct Item: View {
        let title: String

        var body: some View {
            Text(title)
                .padding([.leading, .trailing], .cvMediumSpacing)
                .padding([.top, .bottom], .cvSmallSpacing)
                .font(.cvSemiLargeProminent)
                .foregroundColor(.cvPrimary)
                .background(
                    Capsule(style: .continuous)
                        .fill(Color.cvBackground)
                )
                .shadow(color: .cvShadow, radius: 2)
        }
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(items: ["Test1", "Testdfgd2", "Tesdfgfdsgsfdt3", "Test4", "Test5"])
            .previewLayout(.sizeThatFits)
    }
}
