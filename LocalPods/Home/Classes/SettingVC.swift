//
//  SettingVC.swift
//  Home
//
//  Created by zitao0206 on 2022/11/30.
//

import UIKit
import Foundation

 
public class SettingVC : UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView!

    let cellReuseIdentifier = "Cell"

    lazy var items: [String] = {
            var items = [String]()
            items.append("Fundamental Elements")
            items.append("Static Views")
            items.append("Dynamic Views")
            return items
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        let navBarHeight = navigationController?.navigationBar.frame.height ?? 0
        
        tableView = UITableView(frame: CGRect(x: 0, y: navBarHeight, width: view.bounds.width, height: view.bounds.height - navBarHeight), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.backgroundColor = .white
        view.addSubview(tableView)
        view.backgroundColor = .white
    }
    
    // MARK: - TableView DataSource

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return items.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.backgroundColor = .lightGray.withAlphaComponent(0.5)
        return cell
    }

    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    // MARK: - TableView Delegate
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       print("You tapped cell number \(indexPath.row).")
    }
}
