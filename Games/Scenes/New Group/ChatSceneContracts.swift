//
//  ChatSceneContracts.swift
//  Games
//
//  Created Gungor Basa on 6/29/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

// MARK: - Interactor
protocol ChatSceneInteractorProtocol: class {

    var delegate: ChatSceneInteractorDelegate? { get set }
}

enum ChatSceneInteractorOutput {

}

protocol ChatSceneInteractorDelegate: class {

    func handleOutput(_ output: ChatSceneInteractorOutput)
}

// MARK: - Presenter
protocol ChatScenePresenterProtocol: class {

}

enum ChatScenePresenterOutput: Equatable {

}

// MARK: - View
protocol ChatSceneViewProtocol: class {

    func handleOutput(_ output: ChatScenePresenterOutput)
}

// MARK: - Router
enum ChatSceneRoute: Equatable {

}

protocol ChatSceneRouterProtocol: class {

    func navigate(to route: ChatSceneRoute)
}
