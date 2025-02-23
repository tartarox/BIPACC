//
//  NodesListInteractor.swift
//  BIPACC
//
//  Created by Fabio Yudi Takahara on 21/02/25.
//

import SwiftUI

enum NetworkError: Error {
    case badUrlError
    case badDataError
    case decodeError
    case requestError(message: String)
    
    var localizedDescription: String {
        switch self {
        case .badUrlError:
            return "Bad Request URL"
        case .badDataError:
            return "Bad Data URL"
        case .decodeError:
            return "Error on Decode"
        case .requestError(message: let message):
            return message
        }
    }
}

protocol NodesListInteractorProtocol {
    func fetchNodesList(completion: @escaping (Result<[NodesResponseModel], NetworkError>) -> Void)
}

struct NodesListInteractor: NodesListInteractorProtocol {
    private let connectivityEndpoint: String = "https://mempool.space/api/v1/lightning/nodes/rankings/connectivity"
    
    func fetchNodesList(completion: @escaping (Result<[NodesResponseModel], NetworkError>) -> Void) {
        guard let url = URL(string: connectivityEndpoint) else {
            completion(.failure(NetworkError.badUrlError))
            return
        }
        
        let urlRequest = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(.requestError(message: error.localizedDescription)))
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(NetworkError.badDataError))
                }
                return
            }
            
            do {
                let response = try JSONDecoder().decode([NodesResponseModel].self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(response))
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(.failure(.decodeError))
                }
            }
        }
        
        dataTask.resume()
    }
}
