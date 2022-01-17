//
//  HomeTableViewController.swift
//  Todolist
//
//  Created by Funny Dev on 1/15/22.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var categories: [TodolistCategory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        fetchData()

    }
    
    func fetchData(){
        do {
            categories = try context.fetch(TodolistCategory.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }catch(let error){
            print(error.localizedDescription)
        }
    }
    
    // MARK: - Action
    
    @IBAction func gotoAddNewCategoryTableViewController(_ sender: Any) {
        let storyboard = UIStoryboard(name: "AddNewTableViewController", bundle: nil)
        
        // router to screen `add new category`
        let vc = storyboard.instantiateViewController(withIdentifier: "AddNewTableViewController") as! AddNewCategoryTableViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return categories.count
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Category", for: indexPath)
        fetchData()
        let category = categories[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = category.name
        content.secondaryText = String(category.numberOfTodolist)
        
        content.image = UIImage(systemName: category.iconName!)
        cell.contentConfiguration = content
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "TodolistTableViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TodolistTableViewController") as! TodolistTableViewController
        
//        vc.category = categories[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
//    // MARK: - delegate
//
//    func newCategory(item: TodolistCategory) {
//
//        let newRowIndex = categories.count
//        categories.append(item)
//
//        let indexPath = IndexPath(row: newRowIndex, section: 0)
//        let indexPaths = [indexPath]
//        tableView.insertRows(at: indexPaths, with: .automatic)
//    }
}
