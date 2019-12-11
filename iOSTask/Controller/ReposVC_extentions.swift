//
//  ReposVC_extentions.swift
//  iOSTask
//
//  Created by Ghalii on 12/11/19.
//  Copyright © 2019 Ghalii. All rights reserved.
//

import Foundation
import UIKit


extension ReposVC {
    func Get_data_func(_ PageId : Int){
        
        api_function(PageNumber: PageId, Items_Per_Page: 15, decoded_data: [UserRepoElement].self, vc: self)
        

              Notification_Center.addObserver(self, selector: #selector(Notification_response(notification:)), name: NSNotification.Name(rawValue: "Repos"), object: nil)
       
    }
    
    
         @objc func Notification_response(notification:NSNotification) {
                
                let userInfo:Dictionary<String,Data> = notification.userInfo as! Dictionary<String,Data>
                let data  = userInfo["data"]
            
                guard  let response = try? JSONDecoder().decode([UserRepoElement].self, from: data!) else {
                    
                    return }
                

            
            if flag_for_refreshing == 1{
                self.Repos_array = []
                flag_for_refreshing = 0
            }
            if first_openning_app == 1{
                self.Repos_array = []
                first_openning_app = 0
            }
            
            
            if response.count != 0 {
                self.Repos_array.append(contentsOf: response)
                isLoadingMore = true
                self.cashed_data(self.Repos_array)
                DispatchQueue.main.async {

                    self.tableView.reloadData()
                   
                }

              Notification_Center.removeObserver(self, name:  NSNotification.Name(rawValue: "Repos"), object: nil)
            }else{
                isLoadingMore = false
               
                 Notification_Center.removeObserver(self, name:  NSNotification.Name(rawValue: "Repos"), object: nil)
            }
                    
            }
    
    @objc func refresh(sender:AnyObject) {
       // Code to refresh table view
        DispatchQueue.main.async {
             self.refreshControl.endRefreshing()
        }
        flag_for_refreshing = 1
        pageNumber = 1
        Get_data_func(pageNumber)
       
        
    }
    func open_repo_with_url(_ url : String ) {
        guard let url = URL(string: url) else { return }
        UIApplication.shared.open(url)
    }
    
    func check_saved_data() {
        let Data_array = load_saved_data()
        if Data_array.count != 0 {
            Repos_array = Data_array
            tableView.reloadData()

        }else{
            pageNumber = 1
            Get_data_func(pageNumber)
        }
    }
    
    func load_saved_data () -> [UserRepoElement]{
        var Returned_Data : [UserRepoElement] = []
        if let data = defaults.object(forKey:"Saved_data")as? Data{
            if let Decoded_data = try? JSONDecoder().decode([UserRepoElement].self, from: data) {
                Returned_Data = Decoded_data
            }
            
        }
        return Returned_Data
    }

    func cashed_data(_ data : [UserRepoElement]){
        let encoded_data = data.toJSONData()!
         defaults.set(encoded_data, forKey: "Saved_data")
    }
}
extension ReposVC : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(UITableView.automaticDimension)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Repos_array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReposCell", for: indexPath)as? ReposCell
        cell?.User_Name.text = self.Repos_array[indexPath.row].owner?.login
        cell?.Repo_name.text = self.Repos_array[indexPath.row].name
        cell?.Repo_Description.text = self.Repos_array[indexPath.row].description
        cell?.Fork_Number.text = "\(self.Repos_array[indexPath.row].forks ?? 0) Fork"
        cell?.Language.text = self.Repos_array[indexPath.row].language
        cell?.set_user_image((self.Repos_array[indexPath.row].owner?.avatar_url) ?? " ")
        cell?.set_create_date(self.Repos_array[indexPath.row].created_at ?? " " )
       
        return cell!
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
     
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        open_repo_with_url(self.Repos_array[indexPath.row].html_url ?? "")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
}
extension ReposVC : UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            
            let height = Int(scrollView.frame.size.height)
            let contentYoffset = scrollView.contentOffset.y
        let distanceFromBottom = Int(scrollView.contentSize.height - contentYoffset)
            if distanceFromBottom <= height  && isLoadingMore == true && pageNumber < 5 {
                isLoadingMore = false
              
               
                Get_data_func(pageNumber + 1)
                 pageNumber = pageNumber + 1
              
                   
       
            }
        
      }

    
}
