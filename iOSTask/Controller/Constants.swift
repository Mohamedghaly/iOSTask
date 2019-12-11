//
//  Constants.swift
//  3zzoby
//
//  Created by Ranya Hemy on 8/15/19.
//  Copyright © 2019 Ranya Hemy. All rights reserved.
//

import Foundation
import UIKit

//-------------------------------------------------------------------------------------------------
// Mark : - APIs URLs
//-------------------------------------------------------------------------------------------------
func setup_url(_ PageNumber : Int , _ ItemsNumber : Int) -> URL{
    let url = "https://api.github.com/users/johnsundell/repos?page=\(PageNumber)&per_page=\(ItemsNumber)"
    return URL(string: url)!
    
}




//-------------------------------------------------------------------------------------------------
//-------------------------------------- Constant var --------------------------------------
//-------------------------------------------------------------------------------------------------
let defaults  = UserDefaults.standard
let Notification_Center = NotificationCenter.default
