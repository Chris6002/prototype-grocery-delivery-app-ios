//
//  ViewProductVC.swift
//  WegDeliver
//
//  Created by Tianyou Xiao on 1/27/18.
//  Copyright © 2018 Qiuyue Sun. All rights reserved.
//

import UIKit

class ViewProductVC:UIViewController{
    
    var product:Product{
        didSet {
            navigationItem.title = product.name
        }
    }
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var descrip: UILabel!
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
