//
//  NodesListView.swift
//  BIPACC
//
//  Created by Fabio Yudi Takahara on 21/02/25.
//

import SwiftUI

struct NodesListView: View {
    @StateObject var presenter: NodesListPresenter
    
    var body: some View {
        List(presenter.nodesList) { viewModel in
            NodesListCardView(viewModel: viewModel)
                .listRowSeparator(.hidden)
        }
        .refreshable {
            self.presenter.showNodesList()
        }
        .onAppear {
            self.presenter.showNodesList()
        }
        .alert(isPresented: Binding<Bool>(
            get: { presenter.errorMessage != nil },
            set: { _ in presenter.errorMessage = nil }
        )) {
            Alert(
                title: Text("Error"),
                message: Text(presenter.errorMessage ?? "An error occurred"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}
