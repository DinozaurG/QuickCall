//
//  ContactModel.swift
//  QuickCall
//
//  Created by Алексей Шумейко on 13.04.2021.
//

import SwiftUI
import Foundation
import CoreData

struct Contacts {
    var contacts: Array<Contact>
    
    struct Contact: Identifiable {
        public var id: String
        public var name: String
        public var number: String
    }
    
    init() {
        contacts = Array<Contact>()
    }
    
    func addContact(_ contact: Contact, _ viewContext: NSManagedObjectContext) {
        let newContact = ContactEntity(context: viewContext)
        newContact.id = contact.id
        newContact.name = contact.name
        newContact.number = contact.number
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func chooseContact() {
        
    }
    
    func getContactsFromDB() -> FetchedResults<ContactEntity> {
        @Environment(\.managedObjectContext) var viewContext
        @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \ContactEntity.id, ascending: true)], animation: .default)
            var contacts: FetchedResults<ContactEntity>
        return contacts
    }
    
    func deleteContact() {
        
    }
}
