//
//  DataBaseHelper.swift
//  CoreDataSample
//
//  Created by Kavya KN on 19/02/21.
//  Copyright © 2021 Kavya K N. All rights reserved.
//

import UIKit
import CoreData

class DataBaseHelper: NSObject {
    
    static let sharedInstance = DataBaseHelper()
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveCollegeDataToDataBase(object : [String : String]) {
        let college = NSEntityDescription.insertNewObject(forEntityName: "College", into: context) as! College
        college.name = object["name"]
        college.college = object["college"]
        college.city = object["city"]
        college.university = object["university"]
        do {
            try context.save()
        } catch let err {
            print(err.localizedDescription)
        }
    }
    
    func getAllCollegeData() -> [College] {
        var collegeArray = [College]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "College")
        do {
            collegeArray = try context.fetch(fetchRequest) as! [College]
        } catch let err {
            print(err.localizedDescription)
        }
        return collegeArray
    }
    
    func deleteCollegeData(index : Int) -> [College] {
        var collegeArray = self.getAllCollegeData()
        context.delete(collegeArray[index])
        collegeArray.remove(at: index)
        do {
            try context.save()
        } catch let err {
            print(err.localizedDescription)
        }
        return collegeArray
    }

}
