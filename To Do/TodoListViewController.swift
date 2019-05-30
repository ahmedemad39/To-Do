//
//  ViewController.swift
//  To Do
//
//  Created by Ahmed Emad on 5/21/19.
//  Copyright © 2019 Ahmed Emad. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController{

    var itemArray = ["find mike ", "Buy Eggos","destroy demoo"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    //ده الكود  اللي هايخلي الداتا تظهر في ال table view
    
    
    //MARK - table view data source methdos
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell 
        
    }
    //MARK - table view delegate methode
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print (itemArray[indexPath.row]
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
           tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
       
        
    }
    
    //MARK - Add New items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textfiled = UITextField()
        let alert = UIAlertController(title: "Add new ToDo Liest Items ", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default){
            (action) in
            
            //what will happen once the user hits the add button on our uialert
            self.tableView.reloadData()
            self.itemArray.append(textfiled.text!)
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textfiled = alertTextField
        }
        alert.addAction(action)
        present(alert , animated: true ,completion: nil)
        
        
    }
    
    
}

