//
//  NodesModel.swift
//  BIPACC
//
//  Created by Fabio Yudi Takahara on 21/02/25.
//

import SwiftUI

struct NodesModel: Identifiable {
    let id: Int
    let totalBitcoin: String?
    let firstSeenDate: String?
    let firstSeenTime: String?
    let updateAtDate: String?
    let updateAtTime: String?
    let city: String?
    let country: String?
}
