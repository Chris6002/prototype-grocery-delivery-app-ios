//
//  PVCell.swift
//  WegDeliver
//
//  Created by Tianyou Xiao on 1/27/18.
//  Copyright © 2018 Qiuyue Sun. All rights reserved.
//

import UIKit

class PVCell:UITableViewCell{
    
   //@IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    func updateLabels() {
        let bodyFont = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        name.font = bodyFont
    }
}
