//
//  NodesListPresenter.swift
//  BIPACC
//
//  Created by Fabio Yudi Takahara on 21/02/25.
//

import SwiftUI

protocol NodesListPresenterProtocol {
    func showNodesList()
}

class NodesListPresenter: NodesListPresenterProtocol, ObservableObject {
    private let interactor: NodesListInteractorProtocol
    @Published var errorMessage: String?
    @Published var nodesList: [NodesModel] = []
    
    init(interactor: NodesListInteractor) {
        self.interactor = interactor
    }
    
    func showNodesList() {
        interactor.fetchNodesList { [weak self] result in
            switch result {
            case .success(let nodesList):
                self?.updateNodeList(nodes: nodesList)
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
                break
            }
        }
    }
    
    private func updateNodeList(nodes: [NodesResponseModel]) {
        var list: [NodesModel] = []
        for (id, node) in nodes.enumerated() {
            list.append(
                NodesModel(
                    id: id,
                    totalBitcoin: node.capacity?.toBitcoin,
                    firstSeenDate: node.firstSeen?.fromUnixToDate,
                    firstSeenTime: node.firstSeen?.fromUnixToTime,
                    updateAtDate: node.updatedAt?.fromUnixToDate,
                    updateAtTime: node.updatedAt?.fromUnixToTime,
                    city: getCurrentCity(cityModel: node.city),
                    country: getCurrentCountry(countryModel: node.country)
                )
            )
        }
        
        self.nodesList = list
    }
    
    private func getCurrentCity(cityModel: CityResponseModel?) -> String? {
        return cityModel?.ptBR ?? cityModel?.en
    }
    
    private func getCurrentCountry(countryModel: CountryResponseModel?) -> String? {
        return countryModel?.ptBR ?? countryModel?.en
    }
}
