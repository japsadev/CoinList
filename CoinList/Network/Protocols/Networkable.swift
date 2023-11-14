//
//  Networkable.swift
//  CoinList
//
//  Created by Salih Yusuf Göktaş on 14.11.2023.
//

import Foundation

protocol Networkable {
	func fetchData<T: Decodable>(endpoint: Endpointable, completion: @escaping (Result<T, Error>) -> ())
}
