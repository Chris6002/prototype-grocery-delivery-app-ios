//
//  EZMeals.swift
//  WegDeliver
//
//  Created by Tianyou Xiao on 1/27/18.
//  Copyright © 2018 Qiuyue Sun. All rights reserved.
//

import UIKit

class EZMeals: UITableViewController {
    let sections: [CategorySection] = [CategorySection(type:"Asian")
        ,CategorySection(type:"Choose Your Meal")
        ,CategorySection(type:"Family Pack")
        ,CategorySection(type:"Mexican")
        ,CategorySection(type:"Pasta Bowls")
        ,CategorySection(type:"Power Meals")
        ,CategorySection(type:"Ready To Cook Meat & Seafood")
        ,CategorySection(type:"Sushi")
        ,CategorySection(type:"Veggie Bowls")
        ]
    
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
        return "All EZMeals"
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
