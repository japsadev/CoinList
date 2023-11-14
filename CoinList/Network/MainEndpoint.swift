//
//  MainEndpoint.swift
//  CoinList
//
//  Created by Salih Yusuf Göktaş on 14.11.2023.
//

import Foundation

enum MainEndpoint: Endpointable {
	case list
	
	var baseUrl: String {
		return "https://api.coingecko.com/api/v3/coins"
	}
	
	var fullPath: String {
		return baseUrl + self.rawValue
	}
	
	var rawValue: String {
		switch self {
		case .list: return "/list"
		}
	}
}
