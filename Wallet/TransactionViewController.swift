//
//  ViewController.swift
//  Wallet
//
//  Created by Matteo Manferdini on 15/02/2019.
//  Copyright © 2019 Matteo Manferdini. All rights reserved.
//

import UIKit

class TransactionViewController: UIViewController {
	@IBOutlet weak var amountTextField: UITextField!
	@IBOutlet weak var contactNameLabel: UILabel!
	
	var contact: Contact?
	var transaction: Transaction?
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		amountTextField.becomeFirstResponder()
		if let contact = contact {
			contactNameLabel.text = "\(contact.name) \(contact.surname)"
		}
	}
	
	@IBAction func send(_ sender: Any) {
		Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
			self.performSegue(withIdentifier: "SendTransactionSegue", sender: nil)
		}
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let amount = amountTextField.text?.amount,
			let contact = contact {
			transaction = Transaction(amount: amount, contact: contact)
		}
	}
}

extension String {
	var amount: Int? {
		let formatter = NumberFormatter()
		formatter.numberStyle = .decimal
		guard let number = formatter.number(from: self) else {
			return nil
		}
		return Int(number.doubleValue * 100)
	}
}
