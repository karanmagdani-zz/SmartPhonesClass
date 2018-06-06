//
//  CustomerTableViewController.swift
//  Assignment8
//
//  Created by karan magdani on 3/29/18.
//  Copyright © 2018 karan magdani. All rights reserved.
//

import UIKit

var customerArray = [Customers]()

class CustomerTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customerArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewCust.dequeueReusableCell(withIdentifier: "customerCell", for: indexPath) as! CustomerViewCell
        print(customerArray[indexPath.row].name!)
        cell.custName?.text = (customerArray[indexPath.row].name)
        cell.arrowImg.image = UIImage(named: "arrow")
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    

    @IBOutlet weak var tableViewCust: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewCust.delegate = self
        tableViewCust.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("HEY")
        do {
            
            customerArray = try context.fetch(Customers.fetchRequest())
            for e in customerArray{print(e.name)}
        }
        catch{
            print("ERROR while reading the Rooms")
        }
        tableViewCust.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DisplayCustomerViewController{

            print(customerArray[(tableViewCust.indexPathForSelectedRow?.row)!].name!)
            destination.customer = customerArray[(tableViewCust.indexPathForSelectedRow?.row)!]
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
