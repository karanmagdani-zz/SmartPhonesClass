//
//  AddCustomerViewController.swift
//  Assignment8
//
//  Created by karan magdani on 3/29/18.
//  Copyright © 2018 karan magdani. All rights reserved.
//

import UIKit

class AddCustomerViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var licenseNumber: UITextField!
    @IBOutlet weak var custPhone: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addCustomer(){
        let phoneNumberInt = Int(custPhone.text!)
        if(self.validate(value: (custPhone?.text)!) == true){
            let customer = Customers(context : context)
            customer.name = name!.text!
            customer.address = address!.text!
            customer.idNumber = Int16(licenseNumber.text!)!
            customer.idType = Int16(IdType.drivers_license.hashValue)
            customer.phoneNo = Int64(phoneNumberInt!)
            //            let customer = Customer(name!.text!, address!.text!, IdType.drivers_license, Int(licenseNumber!.text!)!, phoneNumberInt!)
            //            SingletonLists.addToCustomerList(newCust: customer)
            delegate.saveContext()
            SingletonLists.createAlert(titleText: "Customer Added Successfully", messageText: "Horray!")
        }else{
            SingletonLists.createAlert(titleText: "Please Check your phone number", messageText: "Nawww!")
        }
        
        
    }
    
    @IBAction func submit(_ sender: Any) {
        addCustomer()
    }
    func validate(value: String) -> Bool {
        let PHONE_REGEX = "^\\d{10}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        
        return result
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
