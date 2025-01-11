//
//  CVProgressView.swift
//  CV
//
//  Created by Vincent Friedrich on 11.01.25.
//

import SwiftUI

/// This progress view needs to be implemented custom because the ``ProgressView`` component
/// provided by SwiftUI cannot be rendered by the ImageRenderer and results in a yellow view during export
/// while printing the error `Unable to render flattened version of PlatformViewRepresentableAdaptor<Base>`.
struct CVProgressView: View {
    private enum Constant {
        static let maxProgressValue: Float = 1.0
    }
    
    let value: Float
    let tintColor: Color
    let backgroundColor: Color
    
    var body: some View {
        capsule(color: backgroundColor)
            .overlay(alignment: .leading) {
                GeometryReader { proxy in
                    capsule(color: tintColor)
                        .frame(width: proxy.size.width * CGFloat(min(Constant.maxProgressValue, value)))
                }
            }
        
    }
    
    private func capsule(color: Color) -> some View {
        Capsule()
            .fill(color)
            .frame(height: 6)
    }
}

#Preview {
    CVProgressView(value: 0.75, tintColor: .cvAccent, backgroundColor: .cvQuaternary)
}
