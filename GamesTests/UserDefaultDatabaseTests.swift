//
//  NativeDatabaseTest.swift
//  GamesTests
//
//  Created by Gungor Basa on 1/13/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation
import XCTest
@testable import Games

final class UserDefaultDatabaseTests: XCTestCase {

    private let database = UserDefaultsDatabase()
    private let defaults = UserDefaults.standard
    private let game = Game(
        id: 1,
        name: "Name",
        released: "Released",
        background_image: "image",
        metacritic: 99,
        genres: []
    )

    func testGameSave() {
        database.add("game", value: game)

        if let data = defaults.object(forKey: "game") as? Data {
            if let object = try? JSONDecoder().decode(Game.self, from: data) {
                XCTAssert(game == object)
            } else {
                XCTFail("Should be able to convert to game")
            }
        } else {
            XCTFail("Cannot convert to data")
        }
    }

    func testGameDelete() {
        database.add("game", value: game)
        database.remove("game")

        let data = defaults.object(forKey: "game") as? Data

        XCTAssertNil(data)
    }

    func testGameUpdate() {
        database.update("game", value: game)

        if let data = defaults.object(forKey: "game") as? Data {
            if let object = try? JSONDecoder().decode(Game.self, from: data) {
                XCTAssert(game == object)
            } else {
                XCTFail("Should be able to convert to game")
            }
        } else {
            XCTFail("Cannot convert to data")
        }

    }

    func testFetchGame() {
        database.add("game", value: game)

        let result: Game? = database.get("game")

        XCTAssert(game == result)
    }
}
