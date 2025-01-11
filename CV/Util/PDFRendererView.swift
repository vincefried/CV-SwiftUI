//
//  PDFRenderer.swift
//  CV
//
//  Created by Vincent Friedrich on 26.11.22.
//

import SwiftUI

@MainActor
struct PDFRenderView<Content: View>: View {
    private let content: Content
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { proxy in
            NavigationStack {
                List {
                    ForEach(subviews: content) { subview in
                        subview
                            .frame(width: proxy.size.width - .cvMediumSpacing * 2, height: proxy.size.height, alignment: .top)
                    }
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                }
                .navigationTitle("My CV - Made with SwiftUI")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Group(subviews: content) { subviews in
                            ShareLink(item: renderPDF(pageSize: proxy.size, subviews: subviews))
                                .font(.cvSemiLarge)
                                .foregroundStyle(Color.cvAccent)
                        }
                    }
                }
            }
        }
    }
    
    private struct FooterView: View {
        var body: some View {
            Text("This CV was generated in SwiftUI ✨")
                .font(.cvMedium)
                .foregroundStyle(Color.cvTertiary)
        }
    }
    
    private func renderPDF(pageSize: CGSize, subviews: SubviewsCollection) -> URL {
        let outputFileURL = URL.documentsDirectory.appending(path: "CV_Vincent_Friedrich.pdf")
        
        var pageBox = CGRect(x: 0, y: 0, width: pageSize.width, height: pageSize.height)
        guard let pdfContext = CGContext(outputFileURL as CFURL, mediaBox: &pageBox, nil) else {
            return outputFileURL
        }
        
        for subview in subviews {
            let renderer = ImageRenderer(
                content: VStack {
                    subview

                    if subview.id == subviews.last?.id {
                        FooterView()
                            .padding(.top, .cvExtraLargeSpacing)
                    }
                }
                .frame(width: pageSize.width, height: pageSize.height, alignment: .top)
            )
            
            renderer.render { size, renderer in
                pdfContext.beginPDFPage(nil)
                renderer(pdfContext)
                pdfContext.endPDFPage()
            }
        }
        
        pdfContext.closePDF()
        
        return outputFileURL
    }
}

extension CaseIterable where Self: Equatable {
    func next() -> Self? {
        let all = Self.allCases
        guard let index = all.firstIndex(of: self) else {
            return nil
        }
        let nextIndex = all.index(after: index)
        guard nextIndex < all.endIndex else {
            return nil
        }
        return all[nextIndex]
    }
}
