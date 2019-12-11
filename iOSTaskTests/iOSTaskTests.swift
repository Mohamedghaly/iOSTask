//
//  iOSTaskTests.swift
//  iOSTaskTests
//
//  Created by Ghalii on 12/11/19.
//  Copyright © 2019 Ghalii. All rights reserved.
//

import XCTest
@testable import iOSTask

class iOSTaskTests: XCTestCase {


    func testApi() {
        
                            let url = setup_url(1, 10)
                            var request = URLRequest(url: url)
                            request.httpMethod = "GET"
                            
                            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                            // MARK: - URL Session Handeller
                            URLSession.shared.dataTask(with: request) { (data, response, error) in
                                
                              
                              if error != nil{
                                  XCTFail("network fail or server fail")
                              }
                              guard let respnse = try? JSONDecoder().decode( [UserRepoElement].self , from: data!) else {
                                 
                                 XCTFail("There is an error in data")
                               
                                 return}
                                if response == nil{
                                     XCTFail("There is no response")
                                }

                                    }.resume()
    }
    
}
