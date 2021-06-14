//
//  ClassListViewController.swift
//  CoreDataSample
//
//  Created by Kavya KN on 19/02/21.
//  Copyright © 2021 Kavya K N. All rights reserved.
//

import UIKit

class ClassListViewController: UIViewController {

    @IBOutlet weak var collegeTableView: UITableView!
    
    var arrCollege = [College]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        arrCollege = DataBaseHelper.sharedInstance.getAllCollegeData()
        self.collegeTableView.reloadData()
    }

    @IBAction func collegeAddBtnClick(_ sender: UIBarButtonItem) {
        let classFormVC = storyboard?.instantiateViewController(identifier: "ClassFormViewController") as! ClassFormViewController
        self.navigationController?.pushViewController(classFormVC, animated: true)
    }
    
}

extension ClassListViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCollege.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let collegeCell = tableView.dequeueReusableCell(withIdentifier: "CollegeDataTableViewCell", for: indexPath) as! CollegeDataTableViewCell
        collegeCell.college = arrCollege[indexPath.row]
        return collegeCell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrCollege = DataBaseHelper.sharedInstance.deleteCollegeData(index: indexPath.row)
            self.collegeTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

