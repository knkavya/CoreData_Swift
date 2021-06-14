//
//  CollegeDataTableViewCell.swift
//  CoreDataSample
//
//  Created by Kavya KN on 19/02/21.
//  Copyright © 2021 Kavya K N. All rights reserved.
//

import UIKit

class CollegeDataTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCollege: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblUniversity: UILabel!
    
    var college = College() {
        didSet {
            lblName.text = college.name
            lblCollege.text = college.college
            lblCity.text = college.city
            lblUniversity.text = college.university
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
