//
//  AddNewCategoryTableViewController.swift
//  Todolist
//
//  Created by Funny Dev on 1/15/22.
//

import UIKit
import CoreData

class AddNewCategoryTableViewController: UITableViewController, IconCategoryDelegate{
    
    
    var iconName: String = "book.fill"
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "New Category"
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        
        // autofocus text field when comming screen
        txtCategoryName.becomeFirstResponder()
        
        setTextsOnIconCell(iconName: "book.fill")
        
    }
    
    // MARK: - Outlet
    @IBOutlet weak var txtCategoryName: UITextField!
    @IBOutlet weak var iconTableCell: UITableViewCell!
    
    
    // MARK: - Action
    @objc func done(_ sender: Any) {
        
        // TODO: - Create a Category object
        let newCategoryObj = TodolistCategory(context: context)
        newCategoryObj.id = UUID()
        newCategoryObj.name = txtCategoryName.text!
        newCategoryObj.iconName = iconName
        
        // TODO: - Save the data
        do {
            try self.context.save()
            navigationController?.popViewController(animated: true)
        } catch(let error){
            print(error)
        }
        
    }
    
    @objc func cancel(_ sender: Any){
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            let storyboard = UIStoryboard(name: "IconCategoryTableViewController", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "IconCategoryTableViewController") as! IconCategoryTableViewController
            
            vc.delegate = self
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    // MARK: - delegate
    func categoryIcon(icon: String) {
        iconName = icon
        setTextsOnIconCell(iconName: icon)
    }
    
    func setTextsOnIconCell(iconName: String){
        var content = iconTableCell.defaultContentConfiguration()
        content.text = "Category Icon"
        content.secondaryText = iconName
        iconTableCell.contentConfiguration = content
    }
    
}
