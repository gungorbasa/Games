//
//  URLSession.swift
//  Games
//
//  Created by Gungor Basa on 1/10/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

enum URLSessionError: LocalizedError {
  case unknown, urlError
  
  var errorDescription: String? {
    switch self {
    case .urlError:
      return "Cannot convert to url."
    default:
      return "Unknown error is occured during network call."
    }
  }
}

extension URLSession {
  func dataTask(with url: URL, result: @escaping (Result<(URLResponse, Data), Error>) -> Void) -> URLSessionDataTask {
    return dataTask(with: url) { (data, response, error) in
      if let error = error {
        result(.failure(error))
        return
      }
      guard let response = response, let data = data else {
        result(.failure(URLSessionError.unknown))
        return
      }
      result(.success((response, data)))
    }
  }
}
