//
//  ListView.swift
//  WegDeliver
//
//  Created by Tianyou Xiao on 1/28/18.
//  Copyright © 2018 Qiuyue Sun. All rights reserved.
//

import UIKit

class ListView:UIViewController{
    @IBOutlet var lis:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lis.text = ViewController.orderList.description
    }
}
