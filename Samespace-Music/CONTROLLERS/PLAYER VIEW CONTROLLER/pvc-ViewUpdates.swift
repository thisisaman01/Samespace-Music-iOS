//
//  PlayerViewController_ViewUpdates.swift
//  Samespace-Music
//
//  Created by AMAN K.A on 24/01/24.
//
//


import Foundation
import UIKit

extension PlayerViewController {
    func resetViews() {
        updateViews(progress: 0, minString: "00", secString: "00", setPauseButton: false)
    }

    func setViewsBeforeStart(minString: String, secString: String) {
        updateViews(progress: 0, minString: minString, secString: secString, setPauseButton: true)
    }

    func updateViewsWithCurrentProgress(progress: Float, minString: String, secString: String) {
        updateViews(progress: progress, minString: minString, secString: secString, setPauseButton: true)
    }

    func setButtonToPlay() {
        setButtonImage(named: "play.circle.fill")
    }

    func setButtonToPause() {
        setButtonImage(named: "pause.circle.fill")
    }

    private func updateViews(progress: Float, minString: String, secString: String, setPauseButton: Bool) {
        DispatchQueue.main.async { [weak self] in
            self?.progressView.progress = progress
            self?.currentTimeLabel.text = "\(minString):\(secString)"
            if setPauseButton {
                self?.setButtonToPause()
            }
        }
    }

    private func setButtonImage(named imageName: String) {
        let config = UIImage.SymbolConfiguration(pointSize: 64)
        let image = UIImage(systemName: imageName, withConfiguration: config)
        playPauseButton.setImage(image, for: .normal)
    }
}
