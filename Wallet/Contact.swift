//
//  Contact.swift
//  Wallet
//
//  Created by Matteo Manferdini on 15/02/2019.
//  Copyright © 2019 Matteo Manferdini. All rights reserved.
//

import Foundation

struct Contact {
	let name: String
	let surname: String
	let account: String
	
	var initials: String {
		return "\(name.first!)\(surname.first!)"
	}
}
