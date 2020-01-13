//
//  GameListServiceTest.swift
//  GamesTests
//
//  Created by Gungor Basa on 1/13/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import XCTest
@testable import Games

class GameListServiceTest: XCTestCase {

    private let networkingMock:NetworkingMock<GameList> = NetworkingMock()
    private let expectedGame = Game(
        id: 0,
        name: "Name",
        released: "Released",
        background_image: "Image",
        metacritic: 100,
        genres: []
    )
    private lazy var gameList = GameList(next: "Next", results: [expectedGame])

    func testSeviceSuccess() {
        networkingMock.result = .success(gameList)
        let service = GameListService(networking: networkingMock)
        let expectation = XCTestExpectation(description: "Success Expectation")

        service.fetch { result in
            switch result {
            case .success(let games):
                XCTAssert([self.expectedGame] == games)
            case .failure:
                XCTFail("Shouldnt return error")
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 10.0)
    }

    func testServiceFailure() {
        networkingMock.result = .failure(HTTPResponseError.badResponseCode)
        let service = GameListService(networking: networkingMock)
        let expectation = XCTestExpectation(description: "Failure Expectation")

        service.fetch { result in
            switch result {
            case .success:
                XCTFail("Should return error")
            case .failure:
                break
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 10.0)
    }

    func testIsCancelled() {
        networkingMock.result = .success(gameList)
        networkingMock.cancel()
        XCTAssert(networkingMock.isCancelled == true)
    }
}

final class NetworkingMock<U: Codable>: Networking {

    var isCancelled = false
    var result: Result<U, Error>!

    func run<T>(route: Routing, completion: @escaping (Result<T, Error>) -> ()) where T : Decodable, T : Encodable {
        completion(result as! Result<T, Error>)
    }

    func cancel() {
        isCancelled = true
    }
}
