//
//  AddNewCategoryTableViewController.swift
//  Todolist
//
//  Created by Funny Dev on 1/15/22.
//

import UIKit

protocol AddNewCategoryDelegate {
    func newCategory(item: TodolistCategory)
}
class AddNewCategoryTableViewController: UITableViewController{
    
    var delegate: AddNewCategoryDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "New Category"
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        
        // autofocus text field when comming screen
        txtCategoryName.becomeFirstResponder()
    }
    
    // MARK: - Outlet
    @IBOutlet weak var txtCategoryName: UITextField!
    
    // MARK: - Action
    @objc func done(_ sender: Any) {
        let category = TodolistCategory(id: UUID(), name: txtCategoryName.text!)
        delegate?.newCategory(item: category)
        
        navigationController?.popViewController(animated: true)
    }
    
    @objc func cancel(_ sender: Any){
        navigationController?.popViewController(animated: true)
    }
    
}
