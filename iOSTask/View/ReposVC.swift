//
//  ReposVC.swift
//  iOSTask
//
//  Created by Ghalii on 12/10/19.
//  Copyright © 2019 Ghalii. All rights reserved.
//

import UIKit
import AlamofireImage




class ReposVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    var Repos_array : [UserRepoElement] = []
    var list = [UserRepoElement]()
    var pageNumber : Int  = 1
    var isLoadingMore = false
    var refreshControl = UIRefreshControl()
    var flag_for_refreshing : Int = 0
    var first_openning_app : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        refresh_controller_handeller()
        check_saved_data()
        self.pageNumber = 1
        first_openning_app = 1
        Get_data_func(self.pageNumber)
        
    }
    func refresh_controller_handeller(){
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        tableView.addSubview(refreshControl)
    }
    

}

