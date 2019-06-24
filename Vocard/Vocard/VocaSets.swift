//
//  VocaSets.swift
//  Vocard
//
//  Created by 모설아 on 23/06/2019.
//  Copyright © 2019 Snow. All rights reserved.
//

import UIKit
import CoreData

class VocaSets: UIViewController {
    
    
    @IBOutlet weak var vocaTable: UITableView!
    var vocalist = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "VocaSets"
        vocaTable.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    
    @IBAction func addVocalist(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "새 단어장 추가", message: "추가할 단어장 이름을 정해주세요.", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save",style: .default) {
            [unowned self] action in
            
            guard let textField = alert.textFields?.first,
                let nameToSave = textField.text else {
                    return
            }
            
            self.vocalist.append(nameToSave)
            self.vocaTable.reloadData()
        }
    }
    
    // MARK: - UITableViewDataSource
    extension VocaSets: UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return vocalist.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let vocabulary = vocalist[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = vocabulary.value(forKey: "name") as? String
            return cell
        }
}
