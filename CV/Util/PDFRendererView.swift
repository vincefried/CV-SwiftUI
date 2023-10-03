//
//  PDFRenderer.swift
//  CV
//
//  Created by Vincent Friedrich on 26.11.22.
//

import SwiftUI

@MainActor
struct PDFRenderView<Content: View, ScrollPosition: Hashable & CaseIterable>: View {
    @Binding var scrollPosition: ScrollPosition?
    let content: () -> Content
    @State private var isSnapshotting = false
    @State private var shareURL: URL?
    
    var body: some View {
        VStack(spacing: .cvExtraLargeSpacing) {
            if !isSnapshotting {
                if let shareURL = shareURL {
                    ShareLink(item: shareURL)
                        .font(.cvSemiLarge)
                        .foregroundColor(.cvAccent)
                } else {
                    Text("Snapshotting...")
                        .font(.cvSemiLarge)
                        .foregroundColor(.cvTertiary)
                }
            }
            
            content()
            
            if isSnapshotting {
                FooterView()
                    .padding(.top, .cvExtraLargeSpacing)
            }
        }
        .onAppear {
            isSnapshotting = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                shareURL = renderPDF()
                isSnapshotting = false
            }
        }
    }
    
    private struct FooterView: View {
        var body: some View {
            Text("This CV was generated in SwiftUI ✨")
                .font(.cvMedium)
                .foregroundColor(.cvTertiary)
        }
    }
    
    private func renderPDF() -> URL? {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            assertionFailure("Couldn't resolve document directory url.")
            return nil
        }

        let outputFileURL = documentDirectory.appendingPathComponent("CV_Vincent_Friedrich.pdf")

        guard let rootViewController = UIApplication.shared.rootViewController else {
            assertionFailure("Couldn't resolve rootViewController.")
            return nil
        }
        
        rootViewController.view.layoutIfNeeded()
        
        let pageRect = rootViewController.view.frame
        
        let pdfRenderer = UIGraphicsPDFRenderer(bounds: pageRect)

        do {
            try pdfRenderer.writePDF(to: outputFileURL) { (context) in
                var snapshot = true
                while snapshot {
                    if scrollPosition?.next() == nil {
                        snapshot = false
                    }
                    
                    context.beginPage()
                    
                    rootViewController.view.layer.render(in: context.cgContext)
                    
                    if let next = scrollPosition?.next() {
                        scrollPosition = next
                    }
                }
            }
            print("PDF url: \(outputFileURL)")
            return outputFileURL
        } catch {
            print("Could not create PDF file: \(error)")
            return nil
        }
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
