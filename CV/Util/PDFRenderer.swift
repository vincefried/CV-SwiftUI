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
        // TODO: Correct height calculation
        pdfViewController.view.frame = CGRect(
            x: 0,
            y: 0,
            width: rootViewController.view.frame.size.width,
            height: rootViewController.view.frame.size.height * 2
        )
        rootViewController.view.insertSubview(pdfViewController.view, at: 0)

        let pdfRenderer = UIGraphicsPDFRenderer(bounds: pdfViewController.view.frame)

        do {
            try pdfRenderer.writePDF(to: outputFileURL, withActions: { (context) in
                context.beginPage()
                pdfViewController.view.layer.render(in: context.cgContext)
            })
            return outputFileURL
        } catch {
            print("Could not create PDF file: \(error)")
            return nil
        }
    }
}
