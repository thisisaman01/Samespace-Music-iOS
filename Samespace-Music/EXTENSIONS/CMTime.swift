//
//  CMTime_Ext.swift
//  Samespace-Music
//
//  Created by AMAN K.A on 24/01/24.
//
//
import Foundation
import AVFoundation

extension CMTime {
    var minStr: String? {
        let minutes = self.seconds / 60
        return minutes.formattedString
    }
    
    var secStr: String? {
        let seconds = self.seconds.truncatingRemainder(dividingBy: 60)
        return seconds.formattedString
    }
}
