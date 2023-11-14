//
//  MainDataProviderProtocol.swift
//  CoinList
//
//  Created by Salih Yusuf Göktaş on 14.11.2023.
//

import Foundation

protocol MainDataProviderProtocol {
	func fetchCoinList(endpoint: MainEndpoint, completion: @escaping (Result<[CoinListResponse], Error>) -> ())
}
