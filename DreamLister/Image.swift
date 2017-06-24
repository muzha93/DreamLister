//
//  Image.swift
//  DreamLister
//
//  Created by luka on 24/06/2017.
//  Copyright © 2017 luka. All rights reserved.
//

import Foundation
import CoreData

public class Image: ManagedObject {
    @NSManaged public private(set) var image: NSObject
    
    @NSManaged public private(set) var store: Store
    @NSManaged public private(set) var item: Item
    
}
