//
//  PDFRenderer.swift
//  CV
//
//  Created by Vincent Friedrich on 26.11.22.
//

import SwiftUI

final class PDFRenderer<RenderView: View> {
    private let view: RenderView
    init(view: RenderView) {
        self.view = view
    }

    func renderPDF() -> URL? {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            assertionFailure("Couldn't resolve document directory url.")
            return nil
        }

        let outputFileURL = documentDirectory.appendingPathComponent("CV_Vincent_Friedrich.pdf")

        let pdfViewController = UIHostingController(rootView: view)

        defer {
            pdfViewController.removeFromParent()
            pdfViewController.view.removeFromSuperview()
        }

        guard let rootViewController = UIApplication.shared.rootViewController else {
            assertionFailure("Couldn't resolve rootViewController.")
            return nil
        }

        rootViewController.addChild(pdfViewController)
        rootViewController.view.insertSubview(pdfViewController.view, at: 0)
        
        pdfViewController.view.frame = rootViewController.view.frame
        
        pdfViewController.view.layoutIfNeeded()
        
        // If the displayed view contains a scroll view, take its content size, otherwise use the rootViewController's frame
        guard let scrollView = pdfViewController.view.subviews.compactMap({ $0 as? UIScrollView }).first else {
            print("Couldn't find scroll view in view hierarchy")
            return nil
        }
        let contentSize = scrollView.contentSize
        var pageRect = rootViewController.view.frame
        
        pdfViewController.view.frame = pageRect
        
        let pdfRenderer = UIGraphicsPDFRenderer(bounds: pageRect)

        do {
            try pdfRenderer.writePDF(to: outputFileURL) { (context) in
                while pageRect.origin.y < contentSize.height {
                    context.beginPage()
                    pdfViewController.view.layer.render(in: context.cgContext)
                    
                    pageRect.origin.y += pageRect.size.height
                    scrollView.contentOffset.y += pageRect.size.height
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
