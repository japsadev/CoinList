//
//  CellTypes.swift
//  CoinList
//
//  Created by Salih Yusuf Göktaş on 14.11.2023.
//

import Foundation

enum CellTypes {
	case coin(_ list: [CoinListResponse])
	case error(_ error: Error)
}
