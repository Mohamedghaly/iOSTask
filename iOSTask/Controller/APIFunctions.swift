//
//  APIFunctions.swift
//  Bleeza
//
//  Created by Admin on 4/18/19.
//  Copyright © 2019 Ghalii. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD




func api_post <T : Codable> (api_function: String, encodeed_data : Data , decoded_data : T.Type  , vc : UIViewController , header : Bool) {
    SVProgressHUD.show()
    let url = URL(string: BaseUrl+api_function)
    var request = URLRequest(url: url!)
    request.httpMethod = "POST"
    
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    if header == true {
           print("i am here")
           let token = "Bearer \(defaults.object(forKey: "token")as! String)"
           request.setValue(token, forHTTPHeaderField:"Authorization")
       }
    URLSession.shared.uploadTask(with: request, from: encodeed_data) { (data, response, error) in
        print(" response : \(response)")
        print(" data : \(data)")
        print(" error : \(error)")
        if response == nil || data == nil || error != nil{
            SVProgressHUD.dismiss()
            alertss(MSG: "There is an Error", vc: vc)
        }else{
            guard let data  = data else {return}
            let test  = String(data: data, encoding: .utf8)
            let jsonData = test!.data(using: .utf8)!
            print(" data : \(test)")
       
            let decoder = JSONDecoder()
//            decoder.keyDecodingStrategy = .convertFromSnakeCase
            guard let respnse = try? decoder.decode( decoded_data.self , from: jsonData) else {
                
                print("errro decoding \(error?.localizedDescription)")
                SVProgressHUD.dismiss()
                alertss(MSG: "There is an Error", vc: vc)
                return}
            print("decoded response \(respnse)")
           
            nc.post(name: NSNotification.Name(rawValue: "\(api_function)"), object: nil, userInfo: ["data" : respnse.toJSONData()! ])
            SVProgressHUD.dismiss()
        }

            }.resume()
   

}
func api_post_NoBody <T : Codable> (api_function: String,  decoded_data : T.Type  , vc : UIViewController, header : Bool) {
    SVProgressHUD.show()
    let url = URL(string: BaseUrl+api_function)
    var request = URLRequest(url: url!)
    request.httpMethod = "POST"
    
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    if header == true {
           print("i am here")
           let token = "Bearer \(defaults.object(forKey: "token")as! String)"
           request.setValue(token, forHTTPHeaderField:"Authorization")
          
       }
    URLSession.shared.dataTask(with: request) { (data, response, error) in
        print(" response : \(response)")
        print(" data : \(data)")
        print(" error : \(error)")
        if response == nil || data == nil || error != nil{
            SVProgressHUD.dismiss()
            alertss(MSG: "There is an Error", vc: vc)
        }else{
            guard let data  = data else {return}
            let test  = String(data: data, encoding: .utf8)
            let jsonData = test!.data(using: .utf8)!
            print(" data : \(test)")
       
            let decoder = JSONDecoder()
//            decoder.keyDecodingStrategy = .convertFromSnakeCase
            guard let respnse = try? decoder.decode( decoded_data.self , from: jsonData) else {
                
                print("errro decoding \(error?.localizedDescription)")
                SVProgressHUD.dismiss()
                alertss(MSG: "There is an Error", vc: vc)
                return}
            print("decoded response \(respnse)")
           
            nc.post(name: NSNotification.Name(rawValue: "\(api_function)"), object: nil, userInfo: ["data" : respnse.toJSONData()! ])
            SVProgressHUD.dismiss()
        }

            }.resume()
   

}
func alertss(MSG : String , vc: UIViewController)  {
    let alert = UIAlertController(title: "UONO Store", message: MSG, preferredStyle: UIAlertController.Style.alert)
    
    // add the actions (buttons)
    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { action in
        //            self.Store_data()
    }))
    DispatchQueue.main.async {
        vc.present(alert, animated: true, completion: nil)
    }
    
}

//func Store_User_data(data: Data){
//     guard  let respnse = try? JSONDecoder().decode(userDetails.self, from: data) else {return}
//    defaults.set(respnse.UserID, forKey: "UserID")
//    defaults.set(respnse.SessionToken, forKey:
//     defaults.set(respnse.SocialID, forKey: "SocialID")
//     defaults.set(respnse.Social_Token, forKey: "Social_Token")
//
//     defaults.set(respnse.WalletBalance, forKey: "WalletBalance")
//     defaults.set(respnse.Email, forKey: "Email")
//     defaults.set(respnse.NickName, forKey: "NickName")
//     defaults.set(respnse.FullName, forKey: "FullName")
//     defaults.set(respnse.ProfileImage, forKey: "ProfileImage")
//    if respnse.NickName != " "{
//        defaults.set("logedin", forKey: "login")
//    }else {
//        defaults.set(nil, forKey: "login")
//    }
//
//}
func logout(){
  
    defaults.set(nil, forKey: "SocialID")
    defaults.set(nil, forKey: "Social_Token")
    defaults.set("GUEST", forKey: "UserID")
    defaults.set("GUEST", forKey: "SessionToken")
    defaults.set(nil, forKey: "WalletBalance")
    defaults.set(nil, forKey: "Email")
    defaults.set(nil, forKey: "NickName")
    defaults.set(nil, forKey: "FullName")
    defaults.set(nil, forKey: "ProfileImage")
    defaults.set(nil, forKey: "login")
}
