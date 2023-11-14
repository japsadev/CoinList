//
//  MainViewModelProtocol.swift
//  CoinList
//
//  Created by Salih Yusuf Göktaş on 14.11.2023.
//

import Foundation

protocol MainViewModelProtocol {
	var delegate: MainViewModelDelegate? { get set }
	var coinList: [CoinListResponse] { get set }
	var celltypes: [CellTypes] { get set }
	
	func fetchCoinList()
}

enum MainViewNotify {
	case didFetchCoinList
	case error(error: String)
	case reloadTableView
}

protocol MainViewModelDelegate: AnyObject {
	func handle(notify: MainViewNotify)
}
