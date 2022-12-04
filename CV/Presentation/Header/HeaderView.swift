//
//  HeaderView.swift
//  CV
//
//  Created by Vincent Friedrich on 25.11.22.
//

import SwiftUI

struct HeaderView: View {
    let viewModel: HeaderViewModel
    
    private let cornerShapeRectangle = RoundedRectangle(cornerRadius: .cvMediumCornerRadius, style: .continuous)
    
    var body: some View {
        HStack {
            ProfileInfoView(viewModel: viewModel.profileInfo)
                .padding(.cvLargeSpacing)
            ProfileImageView(imageName: viewModel.imageName)
                .frame(width: 150)
                .accessibilityLabel(viewModel.imageDescription)
        }
        .background(
            cornerShapeRectangle
                .fill(Color.cvBackground)
        )
        .clipShape(cornerShapeRectangle)
        .shadow(color: .cvShadow, radius: 15, cornerRadius: .cvMediumCornerRadius, autoSelectBasedOnColorScheme: true)
    }
    
    private struct ProfileInfoView: View {
        let viewModel: HeaderViewModel.ProfileInfo
        
        var body: some View {
            VStack(alignment: .leading, spacing: .cvLargeSpacing) {
                VStack(alignment: .leading, spacing: .cvSmallSpacing) {
                    Text(viewModel.title)
                        .font(.cvExtraLarge)
                        .foregroundColor(.cvPrimary)
                        .accessibilityAddTraits(.isHeader)
                    Text(viewModel.subtitle)
                        .font(.cvLarge)
                        .foregroundColor(.cvSecondary)
                }
                
                ProfileInfoGridView(viewModel: viewModel.gridItems)
            }
        }
    }
    
    private struct ProfileInfoGridView: View {
        let viewModel: [HeaderViewModel.ProfileInfo.GridItem]
        
        private let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
        ]
        
        var body: some View {
            LazyVGrid(columns: columns, alignment: .leading, spacing: .cvSemiLargeSpacing) {
                ForEach(viewModel) { item in
                    Item(viewModel: item)
                }
            }
            .accessibilityElement(children: .combine)
        }
        
        private struct Item: View {
            let viewModel: HeaderViewModel.ProfileInfo.GridItem
            
            var body: some View {
                HStack(spacing: .cvMediumSpacing) {
                    Image(systemName: viewModel.iconName)
                        .font(.cvIcon)
                        .foregroundColor(.cvAccent)
                        .accessibilityHidden(true)
                    
                    VStack(alignment: .leading, spacing: .cvExtraSmallSpacing) {
                        ForEach(viewModel.texts, id: \.self.content) { content, contentDescription in
                            Text(content)
                                .accessibilityLabel("\(contentDescription ?? ""): \(content)")
                        }
                    }
                    .font(.cvMedium)
                    .foregroundColor(.cvPrimary)
                }
            }
        }
    }
    
    private struct ProfileImageView: View {
        let imageName: String
        
        var body: some View {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(
            viewModel: HeaderViewModel(person: .me)
        )
        .padding()
        .previewLayout(.fixed(width: 800, height: 300))
    }
}
