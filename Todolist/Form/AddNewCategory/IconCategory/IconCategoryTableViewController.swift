//
//  IconCategoryTableViewController.swift
//  Todolist
//
//  Created by Funny Dev on 1/16/22.
//

import UIKit

protocol IconCategoryDelegate {
    func categoryIcon(icon: String)
}

class IconCategoryTableViewController: UITableViewController {
    var delegate: IconCategoryDelegate?
    
    var iconSet: [String] = ["note","scribble","paperplane.fill","archivebox.fill","calendar.circle.fill"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iconSet.count
    }
    
    // MARK: - table view data source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IconCategory", for: indexPath)
        
        let icon = iconSet[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = icon
        content.image = UIImage(systemName: icon)
        
        cell.contentConfiguration = content
        return cell
    }
    
    // MARK: - table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.categoryIcon(icon: iconSet[indexPath.row])
        navigationController?.popViewController(animated: true)
    }
    
}
