//
//  PlayerDelegate.swift
//  Samespace-Music
//
//  Created by AMAN K.A on 24/01/24.
//

import Foundation

protocol PlayerDelegate: NSObject, MinimizedPlayerDelgate {
    var isShowingMinimizedPlayer: Bool {set get}
    func loadPlayer(with songs: [Song], startingAt song: Song)
}
