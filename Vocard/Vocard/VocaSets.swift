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
    var vocalists = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "VocaSets"
        vocaTable.register(UITableViewCell.self, forCellReuseIdentifier: "List")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Vocalist")
        
        do {
            vocalists = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }

    
    
    @IBAction func addVocalist(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "새 단어장 추가", message: "추가할 단어장 이름을 정해주세요.", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "저장",style: .default) {
            [unowned self] action in
            
            guard let textField = alert.textFields?.first,
                let nameToSave = textField.text else {
                    return
            }
            
            self.save(name: nameToSave)
            self.vocaTable.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "취소",
                                         style: .cancel)
        
        alert.addTextField()
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    
}

// MARK: - UITableViewDataSource
extension VocaSets: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vocalists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let vocalist = vocalists[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "List", for: indexPath)
        cell.textLabel?.text = vocalist.value(forKey: "name") as? String
        return cell
    }
    
    func save(name: String) {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let entity =
            NSEntityDescription.entity(forEntityName: "Vocalist",
                                       in: managedContext)!
        
        let vocalist = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        
        vocalist.setValue(name, forKey: "name")
        
        do {
            try managedContext.save()
            vocalists.append(vocalist)
        } catch let error as NSError {
            print("저장할 수 없습니다. \(error), \(error.userInfo)")
        }
    }
}
