//
//  MainViewModel.swift
//  CoinList
//
//  Created by Salih Yusuf Göktaş on 14.11.2023.
//

import Foundation

final class MainViewModel: MainViewModelProtocol {
	var delegate: MainViewModelDelegate?
	var coinList: [CoinListResponse] = []
	var celltypes: [CellTypes] = []

	private let dataProvider: MainDataProviderProtocol
	
	init(dataProvider: MainDataProviderProtocol) {
		self.dataProvider = dataProvider
	}
	
	func fetchCoinList() {
		dataProvider.fetchCoinList(endpoint: .list) { result in
			switch result {
			case .success(let success):
				self.celltypes.append(.coin(success))
				self.notify(with: .didFetchCoinList)
			case .failure(let failure):
				self.celltypes.append(.error(failure))
				self.notify(with: .error(error: <#T##String#>))
			}
		}
	}
	
	private func notify(with notify: MainViewNotify) {
		DispatchQueue.main.async {
			self.delegate?.handle(notify: notify)
		}
	}
}
