//
//  Item.swift
//  DreamLister
//
//  Created by luka on 24/06/2017.
//  Copyright © 2017 luka. All rights reserved.
//

import Foundation
import CoreData

public class Item: ManagedObject {
    
    @NSManaged public private(set) var title: String
    @NSManaged public private(set) var details: String
    @NSManaged public private(set) var price: Double
    @NSManaged public private(set) var created: Date
    
    @NSManaged public private(set) var image: Image
    @NSManaged public private(set) var store: Store
    @NSManaged public private(set) var itemType: ItemType
    

    static func insert(into context: NSManagedObjectContext,
                       title: String,
                       created: Date,
                       price: Double,
                       details: String,
                       completion: @escaping (Item) -> ()) {
        context.perform {
            let item: Item = context.insertObject()
            item.title = title
            item.price = price
            item.details = details
            item.created = created
            _ = context.saveOrRollback()
            completion(item)
        }
    }
    
    
}

extension Item: Managed {
    static var sortDescriptor: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(title), ascending: false)]
    }
    
    static var entityName: String {
        return "Item"
    }
}
