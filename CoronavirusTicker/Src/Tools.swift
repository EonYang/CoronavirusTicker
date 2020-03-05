//
//  Tools.swift
//  Cov_in_Status_Bar
//
//  Created by yangyang on 3/4/20.
//  Copyright © 2020 yangyang. All rights reserved.
//

import Cocoa

class Tools {
    
    static func pc (_ regions:[String])-> [String]{
        var r = regions.filter({!Config.China.contains($0)})
        r.append("China")
        r = r.sorted{ $0 < $1 }
        r.insert("World", at: 0)
        return r
    }
}

extension Array where Element: Equatable {
    mutating func removeDuplicates() {
        var result = [Element]()
        for value in self {
            if !result.contains(value) {
                result.append(value)
            }
        }
        self = result
    }
}
