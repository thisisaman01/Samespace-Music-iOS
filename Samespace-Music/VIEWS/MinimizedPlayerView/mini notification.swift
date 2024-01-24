//
//  MinimizedPlayerView_Notifications.swift
//  Samespace-Music
//
//  Created by AMAN K.A on 24/01/24.
//



import UIKit
import Foundation


extension MinimizedPlayerView {
    func addNotificationObserver() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didFinishCurrentTrack),
            name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
            object: nil
        )
    }

    func removeNotificationObserver() {
        NotificationCenter.default.removeObserver(
            self,
            name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
            object: nil
        )
    }

    @objc func didFinishCurrentTrack(notification: Notification) {
        guard
            let currentPlayingSong = currentPlayingSong,
            let currentIndex = songs.firstIndex(where: { $0.id == currentPlayingSong.id }),
            let nextSong = songs.element(at: (currentIndex + 1) % songs.count)
        else {
            return
        }

        self.currentPlayingSong = nextSong
        self.configure(with: nextSong)

        if let url = URL(string: nextSong.url) {
            AudioManager.shared.start(itemURL: url)
        }
    }
}

extension Collection {
    func element(at index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
