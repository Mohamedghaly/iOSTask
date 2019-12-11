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
//------------------------------------------- APIs URLs -------------------------------------------
//-------------------------------------------------------------------------------------------------
let BaseUrl = "http://jinja.ca:8000/api/v1/"
//http://localhost:8000/product_avatar/1575719519.jpg
//http://localhost:8000/shop_avatar/1575719519.jpg
//http://localhost:8000/avatars/1575719519.jpg <---- for users
//http://localhost:8000/brands/1575719519.jpg
let product_img_url = "http://jinja.ca:8000/product_avatar/"
let shop_img_url = "http://jinja.ca:8000/shop_avatar/"
let user_img_url = "http://jinja.ca:8000/avatars/"
let slider_img = "http://jinja.ca:8000/brands/"
let category_img_url = "http://jinja.ca:8000/category_avatars/"
let defaults  = UserDefaults.standard
let nc = NotificationCenter.default

//-------------------------------------------------------------------------------------------------
//-------------------------------------- ViewControllers Ids --------------------------------------
//-------------------------------------------------------------------------------------------------

func CollectionViewlayout(collection : UICollectionView , height : CGFloat){
    var num = 0
    let desgin =  UICollectionViewFlowLayout()
    collection.collectionViewLayout = desgin
    desgin.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
    //        let itemWidth : CGFloat = (collection.frame.width - 10 * 3)
    
    
    let itemWidth : CGFloat = (UIScreen.main.bounds.width - 25)/1
    desgin.itemSize = CGSize(width: itemWidth, height: 200)
    
    //        collection_view.constant = CGFloat((self.featured_pro_array.count / 2)) * (itemWidth)
    desgin.minimumLineSpacing = 10
    desgin.minimumInteritemSpacing = 10
    
    
}

func CollectionViewlayoutVerticall(collection : UICollectionView){
    var num = 0
    let desgin =  UICollectionViewFlowLayout()
    collection.collectionViewLayout = desgin
            desgin.sectionInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    //        if UIScreen.main.bounds.width <= 414{
    //            num = 2
    //        }else {  if UIScreen.main.bounds.width >= 768 {
    //            num = 3
    //            }
    //        }
    let itemWidth : CGFloat = collection.frame.height - 20
//    if collection == first_collection{
        desgin.itemSize = CGSize(width: itemWidth , height: itemWidth + 15)
//    }else if collection == secound_product {
//        desgin.itemSize = CGSize(width: itemWidth - 20, height: itemWidth - 20)
//    }
    
    
    desgin.minimumLineSpacing = 10
    desgin.minimumInteritemSpacing = 0
    desgin.scrollDirection = .horizontal
    //collection.
}
