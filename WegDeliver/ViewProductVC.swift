//
//  ViewProductVC.swift
//  WegDeliver
//
//  Created by Tianyou Xiao on 1/27/18.
//  Copyright © 2018 Qiuyue Sun. All rights reserved.
//

import UIKit

class ViewProductVC:UIViewController{

    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var descrip: UILabel!
    var des:String = ""
    var nameLabel:String = ""
    var it: Item = Item()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = nameLabel
        descrip.text = des
        price.text = "2.69"
        
        if(name.text == "Roasted Turkey Breast"){
            image.image = UIImage(named: "4562")
        }
    }
    
    @IBAction func addList(_ sender:AnyObject){
        ViewController.orderList.append(it)
        print(ViewController.orderList)
    }
    
}
