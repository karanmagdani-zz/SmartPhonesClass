//
//  RoomTableViewController.swift
//  Assignment8
//
//  Created by karan magdani on 3/30/18.
//  Copyright © 2018 karan magdani. All rights reserved.
//

import UIKit

class RoomTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    
    @IBOutlet weak var tableViewRoom: UITableView!
    @IBOutlet weak var searchRoom: UISearchBar!
    var fil = [String]()
    var isSearching = false
    var dataRoom = [Rooms]()
    var filteredData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewRoom.delegate = self
        tableViewRoom.dataSource = self
        searchRoom.delegate = self
        searchRoom.returnKeyType = UIReturnKeyType.done

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("HEYRoom")
        do {
            
            dataRoom = try context.fetch(Rooms.fetchRequest())
//            for e in dataRoom{
//                print("1111Room")
//                print(e.roomName!)
//                
//            }
        }
        catch{
            print("ERROR while reading the Rooms")
        }
        tableViewRoom.reloadData()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching{
            return filteredData.count
        }
        
        return dataRoom.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableViewRoom.dequeueReusableCell(withIdentifier: "cellRoom", for: indexPath) as! RoomTableViewCell
//        print("I came to room")
        //print(dataRoom[indexPath.row])
        
        if isSearching{
            cell.roomNo?.text = "" + String(filteredData[indexPath.row])
            cell.arrow.image = UIImage(named: "arrow")
        }else{
            cell.roomNo?.text = "" + String(dataRoom[indexPath.row].roomName!)
            cell.arrow.image = UIImage(named: "arrow")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedIndex = indexPath.row
        performSegue(withIdentifier: "showRoomDetails", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DisplayRoomViewController{
            print("11111111")
            print(dataRoom[(tableViewRoom.indexPathForSelectedRow?.row)!].roomName!)
            destination.room = dataRoom[(tableViewRoom.indexPathForSelectedRow?.row)!]
        }
    }
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete
        {   context.delete(dataRoom[indexPath.row])
            dataRoom.remove(at: indexPath.row)
            
            delegate.saveContext()
            tableViewRoom.reloadData()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        fil.removeAll()
        if  searchRoom.text == nil || searchRoom.text == ""{
            isSearching = false
            view.endEditing(true)
            tableViewRoom.reloadData()
        }
        else{
            isSearching = true

            for e in dataRoom {
                fil.append(String(e.roomName!))
            }

            filteredData = fil.filter({$0.contains(searchRoom.text!)})
            tableViewRoom.reloadData()
        }
    }

}
