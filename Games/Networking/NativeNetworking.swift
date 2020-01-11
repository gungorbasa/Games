//
//  NativeNetworking.swift
//  Games
//
//  Created by Gungor Basa on 1/10/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

enum HTTPResponseError: LocalizedError {
    case badResponseCode
    case unknown

    var errorDescription: String? {
        return "Bad Response code"
    }
}

final class NativeNetworking: Networking {
    private let session: URLSession = .shared

    func run<T>(route: Routing, completion: @escaping (Result<T, Error>) -> ()) where T : Decodable, T : Encodable {
        var urlComponents = URLComponents(string: route.host + route.path)
        urlComponents?.queryItems = route.parameters.compactMap { key, value in
            URLQueryItem(name: key, value: value as? String)
        }
        
        guard let url = urlComponents?.url else {
            completion(.failure(URLSessionError.urlError))
            return
        }
        let dataTask = session.dataTask(with: url) { [weak self] result in
            guard let self = self else {
                completion(.failure(URLSessionError.unknown))
                return
            }
            switch result {
            case .success(let response, let data):
                if let error = self.checkIfResponseCodeIsOk(response) {
                    completion(.failure(error))
                    return
                } else if let object  = try? JSONDecoder().decode(T.self, from: data) {
                    completion(.success(object))
                } else {
                    completion(.failure(HTTPResponseError.unknown))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
        dataTask.resume()
    }

    func cancel() {


    }

    private func checkIfResponseCodeIsOk(_ response: URLResponse) -> Error? {
        guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode) else {
                return HTTPResponseError.badResponseCode
        }
        return nil
    }
}
