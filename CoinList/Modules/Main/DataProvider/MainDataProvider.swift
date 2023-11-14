//
//  MainDataProvider.swift
//  CoinList
//
//  Created by Salih Yusuf Göktaş on 14.11.2023.
//

import Foundation

final class MainDataProvider: MainDataProviderProtocol {
	
	private let serviceManager: Networkable
	
	init(serviceManager: Networkable) {
		self.serviceManager = serviceManager
	}
	
	func fetchCoinList(endpoint: MainEndpoint, completion: @escaping (Result<[CoinListResponse], Error>) -> ()) {
		serviceManager.fetchData(endpoint: endpoint, completion: completion)
	}
}
