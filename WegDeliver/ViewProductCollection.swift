//
//  ViewProductionViewController.swift
//  WegDeliver
//
//  Created by Tianyou Xiao on 1/27/18.
//  Copyright © 2018 Qiuyue Sun. All rights reserved.
//

import UIKit

class ViewProductCollection: UIViewController {
    
   
    @IBOutlet var collectionView: UICollectionView!
    
    //let entreeDataSource = EntreeDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //collectionView.dataSource = entreeDataSource
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ViewProduct" {
            if (collectionView.indexPathsForSelectedItems?.first) != nil {
                //let entree = entreeDataSource.entrees[selectedIndexPath.row]
                let product = Product(name:"",price:1.234,unit:"/per");
                let viewProductVC = segue.destination as! ViewProductVC
                viewProductVC.product = product
            }
        }
    }
}
