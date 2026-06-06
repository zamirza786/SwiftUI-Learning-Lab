//
//  User.swift
//  Appetizers
//
//  Created by Zahur-Afzal Mirza on 01/04/26.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var extraRequests = false
    var frequentRefills = false
}
