//
//  ReposCell.swift
//  iOSTask
//
//  Created by Ghalii on 12/10/19.
//  Copyright © 2019 Ghalii. All rights reserved.
//

import UIKit

class ReposCell: UITableViewCell {

    
    @IBOutlet weak var User_img: CornerRadiusUIImage!
    
    @IBOutlet weak var User_Name: UILabel!
    @IBOutlet weak var Repo_name: UILabel!
    @IBOutlet weak var CreationDate: UILabel!
    @IBOutlet weak var Repo_Description: UILabel!
    
    @IBOutlet weak var Fork_Number: UILabel!
    
    @IBOutlet weak var Language: UILabel!
    
    
    
    func set_user_image(_ image_url : String){
        if let url = URL(string: image_url){
             self.User_img.af_setImage(withURL: url, placeholderImage:#imageLiteral(resourceName: "placeholder-user-400x400"))
        }else{
            self.User_img.image = #imageLiteral(resourceName: "placeholder-user-400x400")
        }
    }
    
    func set_create_date(_ Create_date : String){
        print(Create_date)
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "dd/MM/yyyy"
        var Date_string = Date()
//        Date_string = dateFormatter.date(from: Create_date)!
        CreationDate.text = Create_date
            //dateFormatter.string(from: Date_string)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
