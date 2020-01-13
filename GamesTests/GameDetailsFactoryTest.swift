//
//  GameDetailsFactoryTest.swift
//  GamesTests
//
//  Created by Gungor Basa on 1/12/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import XCTest
@testable import Games

final class GameDetailsCellFactory: XCTestCase {

    private let factory = GameDetailsFactory()
    private let expectedDetils = DetailsTableViewCellViewModel(
        title: "GTA V",
        description: "Description"
    )
    private let expectedWebsite = URLTableViewCellViewModel(
        title: Localization.GameDetails.visitWebsite.translation,
        url: "website"
    )
    private let expectedReddit = URLTableViewCellViewModel(
        title: Localization.GameDetails.visitReddit.translation,
        url: "reddit"
    )

    func testConvertViewModelsWithURLS() {
        let details = GameDetails(
            id: 1,
            name: "GTA V",
            description_raw: "Description",
            background_image: "image",
            website: "website",
            reddit_url: "reddit"
        )

        let viewModels = factory.cell(from: details)
        XCTAssert(viewModels.count == 3)
        XCTAssert((viewModels[0] as? DetailsTableViewCellViewModel) == expectedDetils)
        XCTAssert((viewModels[1] as? URLTableViewCellViewModel) == expectedReddit)
        XCTAssert((viewModels[2] as? URLTableViewCellViewModel) == expectedWebsite)
    }

    func testConvertViewModelsWithoutURLS() {
        let details = GameDetails(
            id: 1,
            name: "GTA V",
            description_raw: "Description",
            background_image: "image",
            website: nil,
            reddit_url: nil
        )
        let viewModels = factory.cell(from: details)
        XCTAssert(viewModels.count == 1)
        XCTAssert((viewModels[0] as? DetailsTableViewCellViewModel) == expectedDetils)
    }

    func testNoWebsite() {
        let details = GameDetails(
            id: 1,
            name: "GTA V",
            description_raw: "Description",
            background_image: "image",
            website: nil,
            reddit_url: "reddit"
        )
        let viewModels = factory.cell(from: details)
        XCTAssert(viewModels.count == 2)
        XCTAssert((viewModels[0] as? DetailsTableViewCellViewModel) == expectedDetils)
        XCTAssert((viewModels[1] as? URLTableViewCellViewModel) == expectedReddit)
    }

    func testNoReddit() {
        let details = GameDetails(
            id: 1,
            name: "GTA V",
            description_raw: "Description",
            background_image: "image",
            website: "website",
            reddit_url: nil
        )
        let viewModels = factory.cell(from: details)
        XCTAssert(viewModels.count == 2)
        XCTAssert((viewModels[0] as? DetailsTableViewCellViewModel) == expectedDetils)
        XCTAssert((viewModels[1] as? URLTableViewCellViewModel) == expectedWebsite)
    }
}
