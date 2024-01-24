//
//  PlayerViewController_Notifications.swift
//  Samespace-Music
//
//  Created by AMAN K.A on 24/01/24.
//

//import Foundation
//import UIKit
//
//extension PlayerViewController {
//    func addNotificationObserver() {
//        NotificationCenter.default.addObserver(self, selector: #selector(didFinishCurrentTrack), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
//    }
//    
//    func removeNotificationObserver() {
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
//    }
//    
//    @objc func didFinishCurrentTrack(notification: Notification) {
//        moveToNextSong()
//    }
//}


// PlayerViewController_Notifications.swift

import Foundation
import UIKit

extension PlayerViewController {
    func addNotificationObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(didFinishCurrentTrack), name: .AVPlayerItemDidPlayToEndTime, object: nil)
    }
    
    func removeNotificationObserver() {
        NotificationCenter.default.removeObserver(self, name: .AVPlayerItemDidPlayToEndTime, object: nil)
    }
    
    @objc func didFinishCurrentTrack(notification: Notification) {
        DispatchQueue.main.async { [weak self] in
            self?.moveToNextSong()
        }
    }
}
