//
//  AddNewTodolistTableViewController.swift
//  Todolist
//
//  Created by Funny Dev on 1/16/22.
//

import UIKit

class AddNewTodolistTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "New Todolist"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
    }
    
    // MARK: - Outlet
    @IBOutlet weak var todolistName: UITextField!
    @IBOutlet weak var createdDate: UIDatePicker!
    
    // MARK: - Action
    @objc func done(_ sender: Any) {
        print(createdDate.date)
//        navigationController?.popViewController(animated: true)
    }
    
    @objc func cancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

}
