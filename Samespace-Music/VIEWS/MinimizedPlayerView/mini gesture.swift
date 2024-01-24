//
//  MinimizedPlayerView_Gesture.swift
//  Samespace-Music
//
//  Created by AMAN K.A on 24/01/24.
//


import Foundation
import UIKit

extension MinimizedPlayerView {
    func addGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tapGesture)

        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        addGestureRecognizer(longPressGesture)
    }

    @objc func handleTap(gesture: UITapGestureRecognizer) {
        guard let song = currentPlayingSong else { return }
        launchPlayerDelegate?.loadPlayer(with: songs, startingAt: song)
    }

    @objc func handleLongPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            showOptions()
        }
    }

    func showOptions() {
        let optionsAlert = UIAlertController(title: "Options", message: nil, preferredStyle: .actionSheet)

        optionsAlert.addAction(UIAlertAction(title: "Share", style: .default, handler: { _ in
            // Handle share action
        }))

        optionsAlert.addAction(UIAlertAction(title: "Make Favorite", style: .default, handler: { _ in
            // Handle make favorite action
        }))

        optionsAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        if let viewController = UIApplication.shared.keyWindow?.rootViewController {
            viewController.present(optionsAlert, animated: true, completion: nil)
        }
    }
}
