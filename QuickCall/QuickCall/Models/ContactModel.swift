//
//  ContactModel.swift
//  QuickCall
//
//  Created by Алексей Шумейко on 13.04.2021.
//

import Foundation
import UIKit
struct Contacts {
    var contacts: Contact
    
    struct Contact {
        public let name: String
        public let number: String
        public let image: UIImage
    }
}
