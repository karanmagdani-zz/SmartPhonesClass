//
//  DisplayCustomerViewController.swift
//  Assignment8
//
//  Created by karan magdani on 3/29/18.
//  Copyright © 2018 karan magdani. All rights reserved.
//

import UIKit

class DisplayCustomerViewController: UIViewController {
    @IBOutlet weak var displayName: UILabel!
    @IBOutlet weak var displayAddress: UILabel!
    @IBOutlet weak var displayPhone: UILabel!
    var customer : Customers?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayName.text = customer?.name 
        displayAddress.text = customer?.address
        displayPhone.text = String(describing: customer!.phoneNo)
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

}
