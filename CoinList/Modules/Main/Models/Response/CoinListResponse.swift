//
//  CoinListResponse.swift
//  CoinList
//
//  Created by Salih Yusuf Göktaş on 14.11.2023.
//

import Foundation

struct CoinListResponse: Decodable {
	let id: String?
	let symbol: String?
	let name: String?
}
