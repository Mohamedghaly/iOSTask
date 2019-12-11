//
//  APIFunctions.swift
//  Bleeza
//
//  Created by Admin on 4/18/19.
//  Copyright © 2019 Ghalii. All rights reserved.
//

import Foundation
import UIKit




// MARK: - API Handeller
func api_function <T : Codable> (PageNumber : Int,Items_Per_Page : Int, decoded_data : T.Type  , vc : UIViewController) {
    
    let url = setup_url(PageNumber, Items_Per_Page)
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    // MARK: - URL Session Handeller
    URLSession.shared.dataTask(with: request) { (data, response, error) in
        
      
        if response == nil || data == nil || error != nil{
           
           
                 Alert_View(MSG: "There is an Error", vc: vc)
            
           
        }else{
            guard let data  = data else {return}
            let test  = String(data: data, encoding: .utf8)
            let jsonData = test!.data(using: .utf8)!
           
            let decoder = JSONDecoder()
            guard let respnse = try? decoder.decode( decoded_data.self , from: jsonData) else {
              
                
               
                Alert_View(MSG: "There is an Error", vc: vc)
                return}
           
            // MARK: - viewController Data Handeller
            Notification_Center.post(name: NSNotification.Name(rawValue: "Repos"), object: nil, userInfo: ["data" : respnse.toJSONData()! ])
           
        }

            }.resume()
   

}

func Alert_View(MSG : String , vc: UIViewController)  {
    let alert = UIAlertController(title: "Alert", message: MSG, preferredStyle: UIAlertController.Style.alert)
    
   
    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { action in
       
    }))
    DispatchQueue.main.async {
        vc.present(alert, animated: true, completion: nil)
    }
    
}

