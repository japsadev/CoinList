//
//  URLSessionServiceManager.swift
//  CoinList
//
//  Created by Salih Yusuf Göktaş on 14.11.2023.
//

import Foundation

final class URLSessionServiceManager: Networkable {
	func fetchData<T>(endpoint: Endpointable, completion: @escaping (Result<T, Error>) -> ()) where T : Decodable {
		let components = URLComponents(string: endpoint.fullPath)
		
		guard let url = components?.url
		else {
			completion(.failure(NSError(domain: "Invalid URL", code: 404)))
			return
		}
		var request = URLRequest(url: url)
		request.httpMethod = "GET"
		
		URLSession.shared.dataTask(with: request) { data, response, error in
			if let error = error {
				completion(.failure(error))
				return
			}
			guard let data = data
			else {
				completion(.failure(NSError(domain: "No data received", code: 0)))
				return
			}
			
			do {
				let decoder = JSONDecoder()
				let decodedData = try decoder.decode(T.self, from: data)
				completion(.success(decodedData))
			} catch {
				completion(.failure(error))
			}
		}.resume()
	}
}
