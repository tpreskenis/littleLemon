//
//  Extensions.swift
//  LittleLemonResturant
//
//  Created by Tim Preskenis on 3/13/23.
//

import Foundation
import CoreData
import UIKit


public extension NSManagedObject {

    convenience init(context: NSManagedObjectContext) {
        let name = String(describing: type(of: self))
        let entity = NSEntityDescription.entity(forEntityName: name, in: context)!
        self.init(entity: entity, insertInto: context)
    }

}
