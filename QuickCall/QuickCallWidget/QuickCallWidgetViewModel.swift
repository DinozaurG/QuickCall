//
//  QuickCallWidgetViewModel.swift
//  QuickCallWidgetExtension
//
//  Created by Алексей Шумейко on 17.02.2022.
//

import SwiftUI
import ContactsUI
import CoreData

class QuickCallWidgetViewModel {
    static func launchSettings() -> Contacts {
        Contacts()
    }
    
    private(set) var model: Contacts = launchSettings()
    
    var contacts: Array<Contacts.Contact> {
         model.contacts
    }
    
    func getContactsToWidget(count: Int) -> Array<Contacts.Contact> {
        var DBContacts: Array<Contacts.Contact> = Array<Contacts.Contact>()
        let contacts = model.getContactsFromDB()
        var i = 0;
        for contact in contacts {
            DBContacts[i].id = contact.id!
            DBContacts[i].name = contact.name!
            DBContacts[i].number = contact.number!
            print(DBContacts[i].name)
            i += 1
            if (i == count) {
                break
            }
        }
        return DBContacts
    }
}
