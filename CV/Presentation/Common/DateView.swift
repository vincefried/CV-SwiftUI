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
            .background(
                RoundedRectangle(cornerRadius: .cvSmallCornerRadius, style: .continuous)
                    .fill(Color.cvBackground)
                    .shadow(color: .cvShadow, radius: 2, cornerRadius: .cvSmallCornerRadius, autoSelectBasedOnColorScheme: true)
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
