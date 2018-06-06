//
//  BookingTableViewController.swift
//  Assignment8
//
//  Created by karan magdani on 3/30/18.
//  Copyright © 2018 karan magdani. All rights reserved.
//

import UIKit

class BookingTableViewController: UIViewController,UITableViewDelegate,UISearchBarDelegate , UITableViewDataSource {
    @IBOutlet weak var searchRoom: UISearchBar!
    @IBOutlet weak var tableViewBook: UITableView!
    var fil = [String]()
    var isSearching = false
        var dataBook = [Bookings]()
    var filteredData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewBook.delegate = self
        tableViewBook.dataSource = self
        searchRoom.delegate = self
        searchRoom.returnKeyType = UIReturnKeyType.done
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("HEY")
        do {
            
            dataBook = try context.fetch(Bookings.fetchRequest())
//            for e in dataBook{print(e.bookingName)}
        }
        catch{
            print("ERROR while reading the Rooms")
        }
        tableViewBook.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        _ = indexPath.row
        performSegue(withIdentifier: "showBookDetails", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DisplayBookingViewController{
            print("11111111")
            var flag : Int16!
            var i : Int = 0
            print(dataBook[(tableViewBook.indexPathForSelectedRow?.row)!])
            if isSearching {
                print(filteredData[(tableViewBook.indexPathForSelectedRow?.row)!])
                for e in dataBook{
                    
                    if e.bookingName == filteredData[(tableViewBook.indexPathForSelectedRow?.row)!]{
                        flag = Int16(i)
                    }
                    i += 1
                }
                destination.booking = dataBook[Int(flag)]
            }
            else{
                destination.booking = dataBook[(tableViewBook.indexPathForSelectedRow?.row)!]
            }
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete
        {   context.delete(dataBook[indexPath.row])
            dataBook.remove(at: indexPath.row)
            
            delegate.saveContext()
            tableViewBook.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if isSearching{
            return filteredData.count
        }
        
        return dataBook.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableViewBook.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookingViewCell
        print("I came to 123")
        if isSearching {
            cell.bookingName?.text = "" + String(filteredData[indexPath.row])
            cell.arrow.image = UIImage(named: "arrow")
        }
        else{
//
            print("FAKKKKK")
            print(dataBook[indexPath.row].bookNumber)
            cell.bookingName?.text = "Booking " + String(describing: dataBook[indexPath.row].bookingName!)
            cell.arrow.image = UIImage(named: "arrow")
        }
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        fil.removeAll()
        if  searchRoom.text == nil || searchRoom.text == ""{
            isSearching = false
            view.endEditing(true)
            fil.removeAll()
            tableViewBook.reloadData()
        }
        else{
            isSearching = true
            
            for e in dataBook {
                fil.append(String(describing: e.bookingName!))
            }
            
            filteredData = fil.filter({$0.contains(searchRoom.text!)})
            tableViewBook.reloadData()
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

