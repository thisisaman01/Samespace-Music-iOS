//
//  Double_Ext.swift
//  Samespace-Music
//
//  Created by AMAN K.A on 24/01/24.
//

import Foundation

extension Double {
    var formattedString: String? {
        let timeformatter = NumberFormatter()
        timeformatter.minimumIntegerDigits = 2
        timeformatter.minimumFractionDigits = 0
        timeformatter.roundingMode = .down
        
        return timeformatter.string(from: NSNumber(value: self))
    }
}
