//
//  Store.swift
//  DreamLister
//
//  Created by luka on 24/06/2017.
//  Copyright © 2017 luka. All rights reserved.
//

import Foundation
import CoreData

public class Store: ManagedObject {
    @NSManaged public private(set) var name: String
    
    @NSManaged public private(set) var item: Item
    @NSManaged public private(set) var image: Set<Image>
    
}
