//
//  HomeTableViewController.swift
//  Todolist
//
//  Created by Funny Dev on 1/15/22.
//

import UIKit

class HomeTableViewController: UITableViewController,AddNewCategoryDelegate {
    
    var categories = [TodolistCategory]()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Action
    
    @IBAction func gotoAddNewCategoryTableViewController(_ sender: Any) {
        let storyboard = UIStoryboard(name: "AddNewTableViewController", bundle: nil)
        
        // router to screen `add new category`
        let vc = storyboard.instantiateViewController(withIdentifier: "AddNewTableViewController") as! AddNewCategoryTableViewController
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Category", for: indexPath)
        let category = categories[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = category.name
        
        cell.contentConfiguration = content
        return cell
    }
    
    // MARK: - delegate
    
    func newCategory(item: TodolistCategory) {
        let newRowIndex = categories.count
        categories.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
}
