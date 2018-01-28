//
//  ProductDataSource.swift
//  WegDeliver
//
//  Created by Tianyou Xiao on 1/28/18.
//  Copyright © 2018 Qiuyue Sun. All rights reserved.
//

import UIKit
import CoreData

class ProductDataSource: NSObject, UICollectionViewDataSource{
   
    var item: [Item]
    
    init(item: [Item]) {
        self.item = item
        super.init()
    }
    
    
    //
    // MARK: data source functions
    //
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     
        return item.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          
        let identifier = "PVCell"
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! PVCell
        
        let ite = item[indexPath.row]
        
        cell.name.text = ite.name
      
        return cell
    }
}

