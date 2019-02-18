//
//  ContactCell.swift
//  Wallet
//
//  Created by Matteo Manferdini on 15/02/2019.
//  Copyright © 2019 Matteo Manferdini. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
	@IBOutlet weak var initalsLabel: UILabel!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var accountLabel: UILabel!
	@IBOutlet weak var amountLabel: UILabel!
	
	var transaction: Transaction? {
		didSet {
			guard let transaction = transaction else {
				return
			}
			amountLabel.text = "-\(transaction.amount.moneyAmount)"
			set(contact: transaction.contact)
		}
	}
	
	var contact: Contact? {
		didSet {
			if let contact = contact {
				set(contact: contact)
			}
		}
	}
	
	private func set(contact: Contact) {
		initalsLabel.text = contact.initials
		nameLabel.text = contact.name + " " + contact.surname
		accountLabel.text = contact.account
	}
}
