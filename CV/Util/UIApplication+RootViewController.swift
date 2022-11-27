//
//  UIApplication+RootViewController.swift
//  CV
//
//  Created by Vincent Friedrich on 26.11.22.
//

import UIKit

extension UIApplication {
    var rootViewController: UIViewController? {
        Self.shared.connectedScenes.map({ $0 as? UIWindowScene }).compactMap({ $0 }).first?.windows.first?.rootViewController
    }
}
