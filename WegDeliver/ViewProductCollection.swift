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
    
    func getAuth(){
        var keyRequest = URLRequest(url: URL(string: "https://login.microsoftonline.com/1318d57f-757b-45b3-b1b0-9b3c3842774f/oauth2/token")!)
        keyRequest.httpMethod = "POST"
        keyRequest.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        let code = "client_id=24960d97-4fbe-433d-ab8a-efeb89aa524e&grant_type=client_credentials&resource=https://wegmans-es.azure-api.net&client_secret=A8N7VeeCdFD5N4OxeQT1gFaXNStrxieEplYl3SYdxTs=".data(using:String.Encoding.ascii, allowLossyConversion: false)
        keyRequest.httpBody = code
        
    }
        
}
