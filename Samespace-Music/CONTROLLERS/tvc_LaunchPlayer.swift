//
//  TabViewController_LaunchPlayer.swift
//  Samespace-Music
//
//  Created by AMAN K.A on 24/01/24.
//



import Foundation
import UIKit

extension TabViewController: PlayerDelegate {

    func loadMinimizedPlayer(with songs: [Song], startingAt song: Song) {
        if isShowingMinimizedPlayer {
            updateMinimizedPlayer(with: songs, startingAt: song)
        } else {
            initializeMinimizedPlayer(with: songs, startingAt: song)
        }
    }

    private func updateMinimizedPlayer(with songs: [Song], startingAt song: Song) {
        minimizedPlayer.songs = songs
        minimizedPlayer.currentPlayingSong = song
    }

    private func initializeMinimizedPlayer(with songs: [Song], startingAt song: Song) {
        view.addSubview(minimizedPlayer)
        configureMinimizedPlayerLayout()

        minimizedPlayer.launchPlayerDelegate = self
        tabView.removeMask()
        isShowingMinimizedPlayer = true

        updateMinimizedPlayer(with: songs, startingAt: song)
    }

    private func configureMinimizedPlayerLayout() {
        minimizedPlayer.anchor(
            leading: view.leadingAnchor,
            trailing: view.trailingAnchor,
            bottom: tabView.topAnchor,
            height: 64
        )
    }

    func loadPlayer(with songs: [Song], startingAt song: Song) {
        presentPlayerViewController(with: songs, startingAt: song)
    }

    private func presentPlayerViewController(with songs: [Song], startingAt song: Song) {
        let playerController = PlayerViewController()
        playerController.minimizedPlayerDelgate = self
        playerController.songs = songs
        playerController.currentPlayingSong = song

        // Apply custom transition animation
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.fade
        view.window?.layer.add(transition, forKey: kCATransition)

        playerController.modalPresentationStyle = .custom
        present(playerController, animated: false, completion: {
            // Add scaling animation
            playerController.view.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            UIView.animate(withDuration: 0.5, animations: {
                playerController.view.transform = .identity
            })
        })
    }
}


