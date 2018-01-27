//
//  OrderDataSource.swift
//  WegDeliver
//
//  Created by Chris Sun on 1/27/18.
//  Copyright © 2017 Qiuyue Sun. All rights reserved.
//

import UIKit
import CoreData

class OrderDataSource: NSObject{
    var order: [Order]
    
    override init() {
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            let managedContext = delegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<Order>(entityName: "Order")
            
            do {
                order = try managedContext.fetch(fetchRequest)
            }
            catch let error as NSError {
                print("Failed to load persistent data. \(error), \(error.userInfo)")
                order = [Order]()
            }
        }
        else {
            order = [Order]()
        }
       
        
        super.init()
    }
    
    func getOrder(orderNum: Int32) -> Order? {
        if let order = findOrder(with: orderNum) {
            return order
        }
        else {
            return newOrder(with: orderNum)
        }
    }
    
    func findOrder(with orderNum: Int32) -> Order? {
        for ord in order {
            if ord.orderNum == orderNum {
                return ord
            }
        }
        return nil
    }
    
    func newOrder(with orderNum: Int32) -> Order? {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        
        let managedContext = delegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Order", in: managedContext)!
        
        let ord = Order(entity: entity, insertInto: managedContext)
        ord.orderNum = orderNum
        
        
        order.append(ord)
        save()
        return ord
    }
    
    func deleteOrder(ord: Order) {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            print("Failed to delete.")
            return
        }
        
        if let index = order.index(of: ord) {
            
            let managedContext = delegate.persistentContainer.viewContext
            
            managedContext.delete(ord)
            
            order.remove(at: index)
        }
        
        save()
    }
    
    func save() {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            print("Failed to save.")
            return
        }
        
        let managedContext = delegate.persistentContainer.viewContext
        
        do {
            try managedContext.save()
        }
        catch let error as NSError {
            print("Failed to save. \(error), \(error.userInfo)")
        }
    }
    
}

