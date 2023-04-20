// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import UIKit

public class Foast {
    static let sharedInstance = Foast()
    
    private var toastView: UIView?
    private var timer: Timer?

    private init() {}

    public func show(message: String, duration: TimeInterval) {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let mainWindow = windowScene.windows.first {
            
            if toastView != nil {
                hideToast()
            }

            let toastView = ToastView(message: message)
            let hostingController = UIHostingController(rootView: toastView)
            hostingController.view.backgroundColor = .clear
            hostingController.view.translatesAutoresizingMaskIntoConstraints = false
            mainWindow.addSubview(hostingController.view)

            let bottomOffset: CGFloat = 140
            NSLayoutConstraint.activate([
                hostingController.view.centerXAnchor.constraint(equalTo: mainWindow.centerXAnchor),
                hostingController.view.bottomAnchor.constraint(equalTo: mainWindow.bottomAnchor, constant: -bottomOffset)
            ])

            self.toastView = hostingController.view

            // Cancel the previous timer if it exists
            timer?.invalidate()
            
            // Create a new timer
            timer = Timer.scheduledTimer(withTimeInterval: duration, repeats: false) { _ in
                self.hideToast()
            }
        }
    }

    private func hideToast() {
        toastView?.removeFromSuperview()
        toastView = nil
    }
}

extension Foast {
    @discardableResult
    public static func show(message: String, duration: TimeInterval = 2) -> Foast {
        sharedInstance.show(message: message, duration: duration)
        return sharedInstance
    }
}
