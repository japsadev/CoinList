//
//  CoinItemCell.swift
//  CoinList
//
//  Created by Salih Yusuf Göktaş on 14.11.2023.
//

import UIKit

final class CoinItemCell: UITableViewCell {

	@IBOutlet private weak var coinLabel: UILabel!

	func prepareCell(with model: CoinListResponse) {
		coinLabel.text = model.name ?? ""
	}
}
