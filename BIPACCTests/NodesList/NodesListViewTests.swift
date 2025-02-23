//
//  NodesListViewTests.swift
//  BIPACCTests
//
//  Created by Fabio Yudi Takahara on 22/02/25.
//

import XCTest
import SwiftUI
@testable import BIPACC

class NodesListPresenterMock: NodesListPresenter {
    override func showNodesList() {
        self.nodesList = [
            NodesModel(
                id: 0,
                totalBitcoin: "10,0000000",
                firstSeenDate: "10/10/2010",
                firstSeenTime: "10:00",
                updateAtDate: "10/10/2020",
                updateAtTime: "20:00",
                city: "São Paulo",
                country: "Brasil"
            ),
            NodesModel(
                id: 1,
                totalBitcoin: "20,0000000",
                firstSeenDate: "20/10/2010",
                firstSeenTime: "20:00",
                updateAtDate: "20/10/2020",
                updateAtTime: "20:00",
                city: "Tokyo",
                country: "Japão"
            )
        ]
    }
}

class NodesListViewTests: XCTestCase {
    func testOnAppearCallsShowNodesList() {
        let interactor = NodesListInteractor()
        let mockPresenter = NodesListPresenterMock(interactor: interactor)
        mockPresenter.showNodesList()
        XCTAssertEqual(mockPresenter.nodesList.count, 2)
    }
    
    func testErrorCallBack() {
        let interactor = NodesListInteractorMock()
        interactor.fetchNodesList { response in
            switch response {
            case .failure(let error): XCTAssertEqual(error.localizedDescription, "Bad Data URL")
            default: break
            }
        }
    }
}
