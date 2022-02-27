//
//  QuickCallViewModel.swift
//  QuickCall
//
//  Created by Алексей Шумейко on 18.04.2021.
//

import SwiftUI
import ContactsUI
import CoreData

class QuickCallViewModel {
    static func launchSettings() -> Contacts {
        Contacts()
    }
    
    private(set) var model: Contacts = launchSettings()
    
    var contacts: Array<Contacts.Contact> {
         model.contacts
    }
    
    func getContactsFromBook(viewContext: NSManagedObjectContext) {
        let contactStore = CNContactStore()
        let keys = [CNContactGivenNameKey, CNContactPhoneNumbersKey, CNContactImageDataKey] as [CNKeyDescriptor]
        let request = CNContactFetchRequest (keysToFetch: keys)
        var contacts = [CNContact]()
        do {
            try contactStore.enumerateContacts(with: request) {
                (contact, stop) in
                contacts.append(contact)
            }
        }
        catch {
            print("Fail")
        }
        for contact in contacts {
            let newContact: Contacts.Contact = Contacts.Contact(id: contact.identifier, name: contact.givenName, number: (contact.phoneNumbers[0].value).value(forKey: "digits") as! String)
            model.addContact(newContact, viewContext)
        }
    }
}
