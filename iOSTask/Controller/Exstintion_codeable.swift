//
//  Exstintion_codeable.swift
//  3zzoby
//
//  Created by Admin on 8/5/19.
//  Copyright © 2019 Ranya Hemy. All rights reserved.
//

import Foundation
import UIKit


extension Encodable {
    func toJSONData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}
