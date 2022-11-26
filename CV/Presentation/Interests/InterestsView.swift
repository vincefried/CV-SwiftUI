//
//  InterestsView.swift
//  CV
//
//  Created by Vincent Friedrich on 26.11.22.
//

import SwiftUI

struct InterestsView: View {
    let viewModel: InterestsViewModel

    var body: some View {
        TagView(items: viewModel.items.map(\.name))
    }
}

struct InterestsView_Previews: PreviewProvider {
    static var previews: some View {
        InterestsView(viewModel: InterestsViewModel(interests: Person.me.interests))
    }
}
