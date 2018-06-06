//
//  MasterViewController.swift
//  Assignment9
//
//  Created by karan magdani on 3/31/18.
//  Copyright © 2018 karan magdani. All rights reserved.
//

import UIKit
import CoreData

class MasterViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    var detailViewController: DetailViewController? = nil
    var managedObjectContext: NSManagedObjectContext? = nil


    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAPIData()
        // Do any additional setup after loading the view, typically from a nib.
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
            
//            let url = URL(string: "http://api.sandbox.amadeus.com/v1.2/hotels/search-box?south_west_corner=42.134,7.31&north_east_corner=44.69,9.92&check_in=2018-06-28&check_out=2018-07-02&apikey=7RV3RORxUot4ai4zwKAIUAcanZEOXprY")

        }
    }

    override func viewWillAppear(_ animated: Bool) {
    }

    override func didReceiveMemoryWarning() {
        didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func fetchAPIData(){
        
        
        
        // create the request
        let url = URL(string: "http://api.sandbox.amadeus.com/v1.2/hotels/search-box?south_west_corner=42.134,7.31&north_east_corner=44.69,9.92&check_in=2018-06-28&check_out=2018-07-02&apikey=7RV3RORxUot4ai4zwKAIUAcanZEOXprY")

        
        let session = URLSession.shared // or let session = URLSession(configuration: URLSessionConfiguration.default)
        
        if let usableUrl = url {
            let task = session.dataTask(with: usableUrl, completionHandler: { (data, response, error) in
                //                if let data = data {
                //                    if let stringData = String(data: data, encoding: String.Encoding.utf8) {
                //                      print(stringData) //JSONSerialization
                //
                //                    }
                //                }
                if(error != nil){
                    print("ERROR")
                }
                else{
                    do{
                        let fetchedData = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! Dictionary<String,Any>
                        // print(fetchedData)
                        for (key, value) in fetchedData{
                            let v = value as! NSArray
                            for k in v
                            {   let k1 = k as! NSDictionary
                                //print("-------------------------------------------------------")
                                //---------------------------------------HOTEL NAME-------------------------------------------------------------------------
                                
                                
                                
                                //---------------------------------------ADDRESS-------------------------------------------------------------------------
                                var addressData = k1.value(forKey: "address") as! NSDictionary
                                var count:Int = 0
                                var addressReal:String = ""
                                for (keyAdd,valAdd) in addressData{
                                    count += 1
                                    
                                    addressReal += String(describing: valAdd) + " "
                                    
                                    //                                    if(count % 4 == 0){
                                    //                                        count = 0
                                    //                                        print(addressReal)
                                    //                                    }
                                    
                                }
                                //---------------------------------------Price-------------------------------------------------------------------------
                                var priceData = k1.value(forKey: "min_daily_rate") as! NSDictionary
                                var countPrice:Int = 0
                                var priceReal:String = ""
                                for (keyPr,valPr) in priceData{
                                    count += 1
                                    
                                    priceReal += String(describing: valPr) + " "
                                    //
                                    //                                    if(countPrice % 2 == 0){
                                    //                                        countPrice = 0
                                    //
                                    //                                    }
                                    
                                }
                                
                                //---------------------------------------Rating-------------------------------------------------------------------------
                                var priceRating = k1.value(forKey: "awards") as! NSArray
                                var countRat:Int = 0
                                var ratingReal:String = ""
                                for VALR in priceRating{
                                    let valFact = VALR  as! NSDictionary
                                    for (keyRat,valRat) in valFact{
                                        countRat += 1
                                        
                                        ratingReal += String(describing: valRat) + " "
                                        
                                        //                                    if(countRat % valFact.count == 0){
                                        //                                        countRat = 0
                                        //                                        print(ratingReal)
                                        //                                    }
                                        
                                    }
                                    
                                    
                                }
                                
                                //---------------------------------------Amenities-------------------------------------------------------------------------
                                var priceAm = k1.value(forKey: "amenities") as! NSArray
                                var countAm:Int = 0
                                var amenitiesReal:String = ""
                                for values in priceAm{
                                    //                                    print(VALR)
                                    //                                    print(type(of: VALR))
                                    let valFact = values  as! NSDictionary
                                    for (keyA,valA) in valFact{
                                        //                                    print(keyRat)
                                        
                                        countAm += 1
                                        if(String(describing: keyA) == ("description")){
                                            amenitiesReal += String(describing: valA) + ", "
                                        }
                                        //                                        if(countAm %  == 0){
                                        //                                            countAm = 0
                                        //
                                        //                                        }
                                        
                                    }
                                }
                                  print("Hotel Name: ",k1.value(forKey: "property_name")!)
                                print("Hotel Address: ",addressReal)
                                print("Price: ",priceReal)
                                print("Rating: ",ratingReal)
                                print("Amentities: ",amenitiesReal)
//                                var hotel: Hotel = Hotel(context : context)
//                                hotel.name = String(describing: k1.value(forKey: "property_name")!)
//                                hotel.address = String(addressReal)
//                                hotel.price = String(priceReal)
//                                hotel.rating = String(ratingReal)
//                                hotel.amentities = String(amenitiesReal)
//                                hotel.availability = "Vacant"
//                                delega.saveContext()
                                
                            }
                        }
                    }
                    catch{
                        print("Error")
                    }
                }
            })
            task.resume()
        }
        
        }
}
    
    



    // MARK: - Segues


    // MARK: - Table View





    // MARK: - Fetched results controller



    /*
     // Implementing the above methods to update the table view in response to individual changes may have performance implications if a large number of changes are made simultaneously. If this proves to be an issue, you can instead just implement controllerDidChangeContent: which notifies the delegate that all section and object changes have been processed.
     
     func controllerDidChangeContent(controller: NSFetchedResultsController) {
         // In the simplest, most efficient, case, reload the table view.
         tableView.reloadData()
     }
     */



