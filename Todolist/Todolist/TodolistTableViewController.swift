//
//  TodolistTableViewController.swift
//  Todolist
//
//  Created by Funny Dev on 1/16/22.
//

import UIKit

class TodolistTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationItem.title = category?.name
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(gotoAddNewCategoryScreen))
    }
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Todolist", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = "Todolist title"
        content.secondaryText = "2022-01-16"
        
        cell.contentConfiguration = content
        return cell
    }
    
    @objc func gotoAddNewCategoryScreen(_ sender: Any) {
        let storyboard = UIStoryboard(name: "AddNewTodolistTableViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AddNewTodolistTableViewController") as! AddNewTodolistTableViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
