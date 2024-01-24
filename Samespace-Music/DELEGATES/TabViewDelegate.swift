//
//  TabViewDelegate.swift
//  Samespace-Music
//
//  Created by AMAN K.A on 24/01/24.
//

import Foundation
protocol TabViewDelegate: NSObject {
    var isShowingSecondViewController: Bool {get set}
    func switchViewController()
}
