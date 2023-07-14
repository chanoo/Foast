// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import UIKit

public class Foast {
    static let sharedInstance = Foast()
    
    private var toastView: UIView?
    private var timer: Timer?

    // 메시지를 순차적으로 보여주기 위한 큐(queue) 생성
    private var messageQueue: [(message: String, duration: TimeInterval)] = []

    // 현재 메시지가 표시되고 있는지 확인하기 위한 플래그 생성
    private var isShowingMessage: Bool = false

    private init() {}

    public func show(message: String, duration: TimeInterval) {
        // 메시지를 큐에 추가. 즉시 표시하지 않음
        messageQueue.append((message, duration))

        // 아직 메시지를 표시하고 있지 않다면 큐에서 메시지를 가져와 표시
        if !isShowingMessage {
            showMessageFromQueue()
        }
    }

    private func showMessageFromQueue() {
        // 표시할 메시지가 있다면
        if !messageQueue.isEmpty {
            // 큐에서 첫 번째 메시지를 가져옴
            let (message, duration) = messageQueue.removeFirst()

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

                // 이전 타이머가 있다면 취소
                timer?.invalidate()
                
                // 새로운 타이머 생성
                timer = Timer.scheduledTimer(withTimeInterval: duration, repeats: false) { _ in
                    self.hideToast()

                    // 현재 메시지가 사라진 후 다음 메시지를 표시
                    self.showMessageFromQueue()
                }
            }
            
            // 현재 메시지가 표시되고 있다는 것을 표시하기 위해 플래그를 true로 설정
            isShowingMessage = true
        } else {
            // 큐가 비어있을 때는 플래그를 false로 설정
            isShowingMessage = false
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
