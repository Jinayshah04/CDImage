//
//  CoreDataManager.swift
//  CDImage
//
//  Created by mobile1 on 30/11/24.
//

import Foundation
import CoreData
import UIKit
final class CoreDataManager{
    
    func addfromCd(){
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return  }
        
        let managedContext = delegate.persistentContainer.viewContext
        
        guard let imgEntity = NSEntityDescription.entity(forEntityName: "ImgData", in: managedContext) else { return }
        
        let image = NSManagedObject(entity: imgEntity, insertInto: managedContext)
        
        let img = UIImage(named: "sim")
        let idata : Data? = img?.pngData()
        image.setValue(idata, forKey: "img")
        
        do{
            try managedContext.save()
            print(idata!)
            
        }catch let err as NSError{
            print("\(err)")
        }
    }
    
    func readfromCD()->[ImageModel]{
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return [] }
        
        let managedContext = delegate.persistentContainer.viewContext
        
        let img:[ImageModel]=[]
        
        let fetchData = NSFetchRequest<NSFetchRequestResult>(entityName: "ImgData")
        
        do{
            let result = try managedContext.fetch(fetchData)
            for data in result as! [NSManagedObject]{
                print("\(data.value(forKey: "img")!)")
            }
        }catch let err as NSError{
            print("Failed to Fetch Data \(err)")
        }
        
        return img
    }
}
