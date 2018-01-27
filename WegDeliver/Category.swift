//
//  Category.swift
//  WegDeliver
//
//  Created by Tianyou Xiao on 1/27/18.
//  Copyright © 2018 Qiuyue Sun. All rights reserved.
//

import UIKit

class Category:UITableViewController{
  
    
    let sections: [CategorySection] = [CategorySection(type:"Baby Essentials")
        ,CategorySection(type:"Bakery")
        ,CategorySection(type:"Beer Shop")
        ,CategorySection(type:"Beverages")
        ,CategorySection(type:"Bulk Foods")
        ,CategorySection(type:"Cheese Shop")
        ,CategorySection(type:"Coffee Shop")
        ,CategorySection(type:"Dairy")
        ,CategorySection(type:"Deli")
        ,CategorySection(type:"EZMeals")
        ,CategorySection(type:"Floral")
        ,CategorySection(type:"Frozen Foods")
        ,CategorySection(type:"Grocery Food")
        ,CategorySection(type:"Health and Wellness")
        ,CategorySection(type:"Home and Entertaining")
        ,CategorySection(type:"Household Essentials")
        ,CategorySection(type:"International Foods")
        ,CategorySection(type:"Kosher")
        ,CategorySection(type:"Meat")
        ,CategorySection(type:"Nature's Marketplace")
        ,CategorySection(type:"Personal Care and Makeup")
        ,CategorySection(type:"Pet Supplies")
        ,CategorySection(type:"Pizza")
        ,CategorySection(type:"Prepared Foods")
        ,CategorySection(type:"Produce")
        ,CategorySection(type:"Seafood")
        ,CategorySection(type:"Sub Shop")
        ,CategorySection(type:"Sushi")
        ,CategorySection(type:"Wine & Spirits")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "All Product"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        let category = sections[indexPath.row]
        
        cell.textLabel?.text = category.type
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as? CategoryCell
        
        let viewCategoryVC = segue.destination as! ViewProductCollection
        viewCategoryVC.title = cell?.textLabel?.text
    }
  
}
