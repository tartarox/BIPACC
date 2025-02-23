//
//  BIPACCApp.swift
//  BIPACC
//
//  Created by Fabio Yudi Takahara on 21/02/25.
//

import SwiftUI

@main
struct BIPACCApp: App {
    var body: some Scene {
        WindowGroup {
            NodesListFactory.makeView()
        }
    }
}
