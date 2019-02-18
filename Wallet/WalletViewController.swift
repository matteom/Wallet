//
//  WalletViewController.swift
//  Wallet
//
//  Created by Matteo Manferdini on 15/02/2019.
//  Copyright © 2019 Matteo Manferdini. All rights reserved.
//

import UIKit

class WalletViewController: UIViewController {
	@IBOutlet weak var amountLabel: UILabel!
	@IBOutlet weak var tableView: UITableView!
	
	var balance: Int = 543201
	var transactions: [Transaction] = []
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		amountLabel.text = balance.moneyAmount
	}
	
	@IBAction func cancel(_ unwindSegue: UIStoryboardSegue) {}
	
	@IBAction func sendTransaction(_ unwindSegue: UIStoryboardSegue) {
		guard let transactionViewController = unwindSegue.source as? TransactionViewController,
			let transaction = transactionViewController.transaction else {
			return
		}
		transactions.append(transaction)
		balance -= transaction.amount
		tableView.reloadData()
	}
}

extension WalletViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return transactions.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
		cell.transaction = transactions[indexPath.row]
		return cell
	}
}

extension Int {
	var moneyAmount: String {
		let formatter = NumberFormatter()
		formatter.numberStyle = .currency
		formatter.currencySymbol = "€ "
		return formatter.string(from: NSNumber(value: Float(self) / 100))!
	}
}
