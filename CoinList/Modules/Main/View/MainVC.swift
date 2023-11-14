//
//  MainVC.swift
//  CoinList
//
//  Created by Salih Yusuf Göktaş on 14.11.2023.
//

import UIKit

final class MainVC: UIViewController {
	
	@IBOutlet private weak var tableView: UITableView!
	
	var viewModel: MainViewModelProtocol? {
		didSet {
			viewModel?.delegate = self
		}
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		setupTableView()
		registerCells()
		viewModel?.fetchCoinList()
    }
	
	private func setupTableView() {
		tableView.dataSource = self
	}
	
	private func registerCells() {
		let coinCellName = String(describing: CoinItemCell.self)
		let coinCellNib = UINib(nibName: coinCellName, bundle: .main)
		tableView.register(coinCellNib, forCellReuseIdentifier: coinCellName)
	}
}

extension MainVC: UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		guard let sectionCount = viewModel?.celltypes.count
		else { return 0 }
		return sectionCount
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		guard let sectionCell = viewModel?.celltypes[section]
		else { return 0 }
		
		switch sectionCell {
		case .coin(let coins):
			return coins.count
		case .error:
			return 1
		}
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let sectionCell = viewModel?.celltypes[indexPath.section]
		else { return UITableViewCell() }
		
		switch sectionCell {
		case .coin(let coins):
			if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CoinItemCell.self)) as? CoinItemCell {
				cell.prepareCell(with: coins[indexPath.row])
				return cell
			}
		case .error(let error):
			return UITableViewCell()
		}
		return UITableViewCell()
	}
}

extension MainVC: MainViewModelDelegate {
	func handle(notify: MainViewNotify) {
		switch notify {
		case .didFetchCoinList:
			tableView.reloadData()
		case .error(let _):
			print("error")
		case .reloadTableView:
			tableView.reloadData()
		}
	}
}
