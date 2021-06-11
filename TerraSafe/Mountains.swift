//
//  Mountains.swift
//  TerraSafe
//
//  Created by Vivian Angela on 11/06/21.
//

import UIKit
import CoreData

class Mountains {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        lazy var context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
    
    var itemMountains:[Gunung]?
    var itemTrack:[Track]?
    var itemPos:[Pos]?
    var itemObject:[Objek]?
    
    
    func fetchDataMountains() {
        do {
            let request = Gunung.fetchRequest() as NSFetchRequest<Gunung>
            
            self.itemMountains = try context.fetch(request)
            
            //filtering
//            let pred = NSPredicate(format: "name CONTAINS %@", "ted") //variable
//            request.predicate = pred
            
            //sorting
//            let sort = NSSortDescriptor(key: "name", ascending: true)
//            request.sortDescriptors = [sort]
            
            DispatchQueue.main.async {
                //Refresh data
//                self.tableView.reloadData()
            }
            
        } catch {
            
        }
    }
    
    func fetchDataTrack() {
        do {
            let request = Track.fetchRequest() as NSFetchRequest<Track>
            
            self.itemTrack = try context.fetch(request)
            
            DispatchQueue.main.async {
              
            }
            
        } catch {
            
        }
    }
    
    func fetchDataPos() {
        do {
            let request = Pos.fetchRequest() as NSFetchRequest<Pos>
            
            self.itemPos = try context.fetch(request)
            
            DispatchQueue.main.async {
              
            }
            
        } catch {
            
        }
    }
    
    func fetchDataObject() {
        do {
            let request = Objek.fetchRequest() as NSFetchRequest<Objek>
            
            self.itemObject = try context.fetch(request)
            
            DispatchQueue.main.async {
               
            }
            
        } catch {
            
        }
    }
    
    func saveData() {
        do {
            try context.save()
        }catch {
            
        }
    }
    
    func requestData() {
        
    }
    
//    let request : NSFetchRequest<ListOfQuestion> = ListOfQuestion.fetchRequest()
//
//            request.predicate = NSPredicate(format: "question = %@",question)
//
//            do {
//                arrayNoteDetail = try context.fetch(request)
//                questionDetailVariable1 = arrayNoteDetail[0].questionDetail1!
//                questionDetailVariable2 = arrayNoteDetail[0].questionDetail2!
//
//            } catch {
//                print("Error fetching data from context \(error)")
//            }
    
}
