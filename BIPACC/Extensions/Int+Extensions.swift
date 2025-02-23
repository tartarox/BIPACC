//
//  Int+Extensions.swift
//  BIPACC
//
//  Created by Fabio Yudi Takahara on 22/02/25.
//

import SwiftUI

extension Int {
    var toBitcoin: String {
        return String(Double(self) / 100000000).replacingOccurrences(of: ".", with: ",")
    }
    
    var fromUnixToDate: String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: date)
    }
    
    var fromUnixToTime: String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
}
