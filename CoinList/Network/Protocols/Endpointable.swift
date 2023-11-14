//
//  Endpointable.swift
//  CoinList
//
//  Created by Salih Yusuf Göktaş on 14.11.2023.
//

import Foundation

protocol Endpointable {
	var baseUrl: String { get }
	var fullPath: String { get }
	var rawValue: String { get }
}
