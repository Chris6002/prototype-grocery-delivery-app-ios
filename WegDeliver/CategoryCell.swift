//
//  ProductCell.swift
//  WegDeliver
//
//  Created by Tianyou Xiao on 1/27/18.
//  Copyright © 2018 Qiuyue Sun. All rights reserved.
//

import UIKit

class CategoryCell:UITableViewCell{
    @IBOutlet var title: UILabel!
   
    
    func updateLabels() {
        let bodyFont = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        title.font = bodyFont
    }
}
