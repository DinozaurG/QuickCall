//
//  ContactEntity+CoreDataProperties.swift
//  QuickCall
//
//  Created by Алексей Шумейко on 17.02.2022.
//
//

import Foundation
import CoreData


extension ContactEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ContactEntity> {
        return NSFetchRequest<ContactEntity>(entityName: "ContactEntity")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var number: String?

}

extension ContactEntity : Identifiable {

}
