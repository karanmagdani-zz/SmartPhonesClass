//
//  MasterViewController.swift
//  Assignment8
//
//  Created by karan magdani on 3/29/18.
//  Copyright © 2018 karan magdani. All rights reserved.
//

import UIKit
import CoreData

class MasterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    var detailViewController: DetailViewController? = nil
    var managedObjectContext: NSManagedObjectContext? = nil
    let list = ["Customer","Room","Booking"]

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAPIRequest()
        
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func fetchAPIRequest()    {
        
    
    
//    let url = URL(string: "http://api.sandbox.amadeus.com/v1.2/hotels/search-box?south_west_corner=82.134,87.31&north_east_corner=84.69,89.92&check_in=2018-06-28&check_out=2018-07-02&apikey=")
    
        let url = URL(string:"http://api.sandbox.amadeus.com/v1.2/hotels/search-box?south_west_corner=1,70.31&north_east_corner=50,90&check_in=2018-06-28&check_out=2018-07-02&apikey=AoImFpsXDs9kx6UUBacykr9WOH5ZOUuV")
        
    let session = URLSession(configuration: URLSessionConfiguration.default)
    print("DID I COME HITHER")
    if let usableUrl = url {
        let task = session.dataTask(with: usableUrl, completionHandler: { (data, response, error) in
            if(error != nil){
                print(error)
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
                            var addressData = k1.value(forKey: "address") as! NSDictionary
                            var count:Int = 0
                            var addressReal:String = ""
                            for (keyAdd,valAdd) in addressData{
                                count += 1
                                
                                addressReal += String(describing: valAdd) + " "
                            }
                            var priceData = k1.value(forKey: "min_daily_rate") as! NSDictionary
                            var countPrice:Int = 0
                            var priceReal:String = ""
                            for (keyPr,valPr) in priceData{
                                count += 1
                                
                                priceReal += String(describing: valPr) + " "
                            }
                            var priceRating = k1.value(forKey: "awards") as! NSArray
                            var countRat:Int = 0
                            var ratingReal:String = ""
                            for VALR in priceRating{
                                let valFact = VALR  as! NSDictionary
                                for (keyRat,valRat) in valFact{
                                    countRat += 1
                                    
                                    ratingReal += String(describing: valRat) + " "
                                }
                                
                                
                            }
                            var priceAm = k1.value(forKey: "amenities") as! NSArray
                            var countAm:Int = 0
                            var amenitiesReal:String = ""
                            for values in priceAm{
                                let valFact = values  as! NSDictionary
                                for (keyA,valA) in valFact{
                                    countAm += 1
                                    if(String(describing: keyA) == ("description")){
                                        amenitiesReal += String(describing: valA) + ", "
                                    }
                                }
                            }
//                            print(k1.value(forKey: "property_name")!)
                            var room: Rooms  = Rooms(context: context)
                            room.roomName = String(describing: k1.value(forKey: "property_name")!)
                            room.hotelAddress = String(addressReal)
                            room.price = priceReal
                            room.ratings = String(ratingReal)
                            room.amenities = String(amenitiesReal)
                            SingletonLists.addRoom(newRoom: room)
                            delegate.saveContext()
                            
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
//    override func viewWillAppear(_ animated: Bool) {
//        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
//        super.viewWillAppear(animated)
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainScreenCell")
        cell?.textLabel?.text = list[indexPath.row].capitalized
        cell?.imageView?.image = UIImage(named: list[indexPath.row])
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        switch indexPath.row{
        case 0: performSegue(withIdentifier: "showCustomer", sender: self)
            break
        case 1:
            performSegue(withIdentifier: "showRoom", sender: self)
            break;
        case 2:
            performSegue(withIdentifier: "showBooking", sender: self)
            
        default: break;
            
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    // MARK: - Segues

}
