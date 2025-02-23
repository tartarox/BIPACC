//
//  NodesListInteractorTests.swift
//  BIPACCTests
//
//  Created by Fabio Yudi Takahara on 22/02/25.
//

import XCTest
@testable import BIPACC

class NodesListInteractorMock: NodesListInteractorProtocol {
    func fetchNodesList(completion: @escaping (Result<[BIPACC.NodesResponseModel], BIPACC.NetworkError>) -> Void) {
        completion(.failure(NetworkError.badDataError))
    }
}
