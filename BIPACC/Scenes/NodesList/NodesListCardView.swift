//
//  NodesListCardView.swift
//  BIPACC
//
//  Created by Fabio Yudi Takahara on 22/02/25.
//

import SwiftUI

struct NodesListCardView: View {
    var viewModel: NodesModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top, spacing: 8) {
                if let city = viewModel.city {
                    Text(city)
                        .font(.headline)
                    Text("-")
                }
                
                if let country = viewModel.country {
                    Text(country)
                        .font(.headline)
                }
            }
            
            HStack(alignment: .top, spacing: 8) {
                if let bitcoins = viewModel.totalBitcoin {
                    Text("BTC:")
                        .font(.headline)
                    Text(bitcoins)
                }
            }
            
            HStack(alignment: .top, spacing: 8) {
                Text("Since:")
                    .font(.headline)
                if let firstDate = viewModel.firstSeenDate {
                    Text(firstDate)
                    Text("-")
                }
                
                if let firstTime = viewModel.firstSeenTime {
                    Text(firstTime)
                }
            }
            
            HStack(alignment: .top, spacing: 8) {
                Text("Last Update:")
                    .font(.headline)
                if let updateAtDate = viewModel.updateAtDate {
                    Text(updateAtDate)
                    Text("-")
                }
                
                if let updateAtTime = viewModel.updateAtTime {
                    Text(updateAtTime)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(6)
        .shadow(radius: 3)
    }
}
