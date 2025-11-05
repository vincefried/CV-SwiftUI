//
//  DateView.swift
//  CV
//
//  Created by Vincent Friedrich on 26.11.22.
//

import SwiftUI

struct DateView: View {
    let date: String
    
    var body: some View {
        Text(date)
            .padding([.leading, .trailing], .cvSemiSmallSpacing)
            .padding([.top, .bottom], .cvSmallSpacing)
            .font(.cvSemiLargeProminent)
            .foregroundStyle(Color.cvPrimary)
            .overlay(
                RoundedRectangle(cornerRadius: .cvSmallCornerRadius)
                    .stroke(Color.cvTertiary.opacity(0.3))
            )
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView(date: "Today")
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
