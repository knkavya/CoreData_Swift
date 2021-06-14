//
//  ClassFormViewController.swift
//  CoreDataSample
//
//  Created by Kavya KN on 19/02/21.
//  Copyright © 2021 Kavya K N. All rights reserved.
//

import UIKit

class ClassFormViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var txtCollegeName: UITextField!
    @IBOutlet weak var txtCollege: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtUniversity: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnCollegeSaveClick(_ sender: UIButton) {
        self.saveCollegeData()
        self.navigationController?.popViewController(animated: true)
    }

}

extension ClassFormViewController {
    
    func saveCollegeData() {
        let collegeDict = [
            "name" : "Name : \(txtCollege.text!)",
            "college" : "College : \(txtCollege.text!)",
            "city" : "City : \(txtCity.text!)",
            "university" : "University : \(txtUniversity.text!)"
        ]
        DataBaseHelper.sharedInstance.saveCollegeDataToDataBase(object: collegeDict)
    }
}
