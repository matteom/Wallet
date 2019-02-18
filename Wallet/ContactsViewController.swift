//
//  ContactsViewController.swift
//  Wallet
//
//  Created by Matteo Manferdini on 15/02/2019.
//  Copyright © 2019 Matteo Manferdini. All rights reserved.
//

import UIKit

class ContactsViewController: UITableViewController {
	let contacts = [
		Contact(name: "Alan", surname: "Johnson", account: "NL 34 EFGH 9876 5432"),
		Contact(name: "Brian", surname: "Freeman", account: "NL 56 XYWZ 1357 2468"),
		Contact(name: "Heather", surname: "Morgan", account: "NL 98 QWER 0864 9753"),
		Contact(name: "John", surname: "Appleseed", account: "NL 81 POIU 3157 8064"),
		Contact(name: "Julia", surname: "Henry", account: "NL 62 MBCZ 5674 8769")
	]
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return contacts.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
		cell.contact = contacts[indexPath.row]
		return cell
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard let row = tableView.indexPathForSelectedRow?.row else {
			return
		}
		let selectedContact = contacts[row]
		if let transactionViewController = segue.destination as? TransactionViewController {
			transactionViewController.contact = selectedContact
		}
	}
}
