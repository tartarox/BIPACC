//
//  NodesListFactory.swift
//  BIPACC
//
//  Created by Fabio Yudi Takahara on 21/02/25.
//

import SwiftUI

struct NodesListFactory {
    static func makeView() -> some View {
        let interactor = NodesListInteractor()
        let presenter = NodesListPresenter(interactor: interactor)
        let view = NodesListView(presenter: presenter)
        return view
    }
}
