//
//  MinimizedPlayerDelgate.swift
//  Samespace-Music
//
//  Created by AMAN K.A on 24/01/24.
//

import Foundation
protocol MinimizedPlayerDelgate: NSObject {
    func loadMinimizedPlayer(with songs: [Song], startingAt song: Song)
}
