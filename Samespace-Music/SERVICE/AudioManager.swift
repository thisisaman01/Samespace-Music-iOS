//
//  AudioManager.swift
//  Samespace-Music
//
//  Created by AMAN K.A on 24/01/24.
//



import Foundation
import AVFoundation

final class AudioManager {
    static let shared = AudioManager()
    
    private var player: AVPlayer?
    private var timeObserver: Any?
    
    var isPlaying: Bool {
        return player?.timeControlStatus == .playing
    }
    
    var isPaused: Bool {
        return player?.timeControlStatus == .paused
    }
    
    var currentAsset: AVAsset? {
        return player?.currentItem?.asset
    }
    
    var currentTime: CMTime {
        return player?.currentTime() ?? .zero
    }
    
    var duration: CMTime {
        return player?.currentItem?.duration ?? .zero
    }
    
    private init() {
        // Additional setup if needed
    }
    
    func start(itemURL: URL) {
        let item = AVPlayerItem(url: itemURL)
        
        if let player = player {
            player.replaceCurrentItem(with: item)
        } else {
            player = AVPlayer(playerItem: item)
        }
        
        play()
    }
    
    func play() {
        guard !isPlaying else {
            return
        }
        
        player?.play()
    }
    
    func pause() {
        guard isPlaying else {
            return
        }
        
        player?.pause()
    }
    
    func stop() {
        removeTimeObserver()
        player = nil
    }
    
    func addTimeObserver(completion: @escaping (CMTime) -> Void) {
        timeObserver = player?.addPeriodicTimeObserver(forInterval: CMTime(value: 1, timescale: 1), queue: .main, using: { [weak self] time in
            guard let self = self else { return }
            completion(time)
        })
    }
    
    func removeTimeObserver() {
        if let observer = timeObserver {
            player?.removeTimeObserver(observer)
            timeObserver = nil
        }
    }
    
    func restart() {
        player?.seek(to: .zero)
    }
}
