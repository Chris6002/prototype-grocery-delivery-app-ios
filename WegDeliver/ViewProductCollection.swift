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
        getProduct()
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
    
    func getProduct(){
        var keyRequest = URLRequest(url: URL(string: "https://login.microsoftonline.com/1318d57f-757b-45b3-b1b0-9b3c3842774f/oauth2/token")!)
        keyRequest.httpMethod = "POST"
        keyRequest.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        let code = "client_id=24960d97-4fbe-433d-ab8a-efeb89aa524e&grant_type=client_credentials&resource=https://wegmans-es.azure-api.net&client_secret=A8N7VeeCdFD5N4OxeQT1gFaXNStrxieEplYl3SYdxTs=".data(using:String.Encoding.ascii, allowLossyConversion: false)
        keyRequest.httpBody = code
        let task = URLSession.shared.dataTask(with: keyRequest) { (data: Data?, response: URLResponse?, error: Error?) in
            if error != nil{
                return
            }
            if let data = data{
                var authorization = ""
                do {
                    let jsonAuthObject: Any = try JSONSerialization.jsonAuthObject(with: data, options: [])
                    let jsonAuthDict = jsonAuthObject as! [String:String]
                    let tokenType = jsonAuthDict["token_type"]
                    let accessToken = jsonAuthDict["access_token"]
                    authorization = tokenType! + " " + accessToken!
                }catch let error {
                    print("Auth JSON Parse Error")
                    return
                }
                
                //Request product info by search criterion
                let productSearchURL = URL(string: "https://wegmans-es.azure-api.net/productpublic/producthierarchies/Marketing/EZ%20Meals/Asian")!;
                
                var productRequest = URLRequest(url: productSearchURL)
                productRequest.httpMethod = "GET"
                productRequest.addValue("dbf9da0bc0814d07b6687136b4b36dd7", forHTTPHeaderField: "Product-Subscription-Key")
                productRequest.addValue(authorization, forHTTPHeaderField: "Authorization")
                
                URLSession.shared.dataTask(with: productRequest) { (data, response, error) in
                    
                    if let data = data {
                        print("Product Request")
                        do{
                            let jsonRootObject: Any = try JSONSerialization.jsonRootObject(with: data, options: [])
                            let jsonRootDict = jsonRootObject as! [String:String]
                            let jsonNode1Object = jsonRootDict["Nodes"]
                            print(jsonNode1Object)
                        }catch let error{
                            print("Prod JSON Parse Error")
                            return
                        }
                    }else{
                        print("failed")
                    }
                }.resume()

            }
            
        }
        task.resume()
        
    }
    
}

extension URL {
    
    func withQueries(_ queries: [String: String]) -> URL? {
        
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.flatMap { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}
