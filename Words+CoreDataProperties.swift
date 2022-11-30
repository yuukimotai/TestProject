//
//  Words+CoreDataProperties.swift
//  TestProject
//
//  Created by 茂田井雄輝 on 2022/11/30.
//
//

import Foundation
import CoreData


extension Words {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Words> {
        return NSFetchRequest<Words>(entityName: "Words")
    }

    @NSManaged public var english_word: String?
    @NSManaged public var japanese_word: String?

}

extension Words : Identifiable {

}
