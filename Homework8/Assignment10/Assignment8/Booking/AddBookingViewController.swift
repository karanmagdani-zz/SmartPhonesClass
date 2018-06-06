//
//  AddBookingViewController.swift
//  Assignment8
//
//  Created by karan magdani on 3/30/18.
//  Copyright © 2018 karan magdani. All rights reserved.
//

import UIKit

class AddBookingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var customerPicker: UIPickerView!
    @IBOutlet weak var scrollview: UIScrollView!
    
    @IBOutlet weak var fromDatePicker: UIDatePicker!
    @IBOutlet weak var roomPicker: UIPickerView!
    @IBOutlet weak var toDatePicker: UIDatePicker!
    var selectedCustomer : Customers?
    var selectedRoom: Rooms?
    var customerList: [Customers]!
    let data = [Customers]()
    let roomData = [Rooms]()
    override func viewDidLoad() {
        scrollview.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height+100)
        roomPicker.delegate = self
        customerPicker.delegate = self
        super.viewDidLoad()
        do{
            //            FIX FROM HERE!!!!
            let data = try context.fetch(Customers.fetchRequest())
            for each in data{
                //                print("added", each as! Customers)
                if let cust : Customers = each as? Customers {
                    SingletonLists.customerList.append(cust)
                }
            }
            for each in roomData{
                if let room: Rooms = each as? Rooms {
                    SingletonLists.roomList.append(room)
                }
            }
            
            customerPicker.dataSource = SingletonLists.customerList as? UIPickerViewDataSource
            
        }catch{
            //handle error
        }
        roomPicker.dataSource = SingletonLists.roomList as? UIPickerViewDataSource
        // Do any additional setup after loading the view.
    }
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func submit(_ sender: Any) {
        let dateTo = fromDatePicker.date
        let dateFrom = toDatePicker.date
        let daysBetweenDates = calculateDaysBetweenTwoDates(start: dateTo, end: dateFrom);
        print(daysBetweenDates)
        if(daysBetweenDates > 1){
            //            REMOVE COMMENT
            if(checkIfRoomAvailableForDates(start: dateFrom, end: dateTo, room: selectedRoom!)){
                let booking = Bookings(context: context)
                booking.bookingName = String(selectedCustomer!.name!) + String(describing: selectedRoom!.roomNumber)
                booking.bookNumber = Int16(selectedRoom!.roomNumber)
                booking.customer = selectedCustomer
                booking.room = selectedRoom
                booking.fromDate = dateFrom
                booking.toDate = dateTo
                
                //                let booking = Booking(selectedCustomer!, dateFrom, dateTo, selectedRoom!)
                delegate.saveContext()
                SingletonLists.addBooking(newBooking: booking)
                SingletonLists.createAlert(titleText: "Booking Created", messageText: "Booking has been successfully created")
                print("FUCK YEAHHHHH")
            }else{
                SingletonLists.createAlert(titleText: "Duplicate Booking", messageText: "There is already  a booking for these dates")
            }
        }else if(daysBetweenDates == -1){
            SingletonLists.createAlert(titleText: "Invalid Date", messageText: "You can't make a booking in the past")
        }
        else{
            SingletonLists.createAlert(titleText: "Invalid Booking", messageText: "Please Select more than one day")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createBookingConstructor(){
        //        let dateFormatter = DateFormatter()
        //        dateFormatter.dateFormat = "yyyy-MM-dd" //Your date format
        //        let dateTo = dateFormatter.date(from: <#T##String#>)
        //        let dateFrom = dateFormatter.date(from: dateFromStr!.text)
        
    }
    
    private func calculateDaysBetweenTwoDates(start: Date, end: Date) -> Int {
        let currentDateTime = Date()
        if(start < currentDateTime){
            return -1
        }
        let currentCalendar = Calendar.current
        //    guard is similar to if else.. it is the else part
        
        guard let start = currentCalendar.ordinality(of: .day, in: .era, for: start) else {
            return 0
        }
        guard let end = currentCalendar.ordinality(of: .day, in: .era, for: end) else {
            return 0
        }
        return end - start
    }
    
    //    REMOVE comment
    func checkIfRoomAvailableForDates(start: Date, end: Date, room: Rooms) -> Bool{
        print("i am trying new booking for this room " ,room.roomName!)
        for b in SingletonLists.bookList{
            if(b.room?.roomName == room.roomName){
                if(start.compare(b.fromDate as! Date) != .orderedSame || end.compare(b.toDate as! Date) != .orderedSame){
                    print("We cant complete this booking as the room is unavailable for the selected days")
                    print()
                    return false;
                }
            }
        }
        print("Booking has been created successfully")
        print()
        return true;
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView == customerPicker){
            print("print")
            print(SingletonLists.customerList)
            return (SingletonLists.customerList.count)
        }else{
            return SingletonLists.roomList.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView == customerPicker){
            return String(describing: SingletonLists.customerList[row].name!)
        }else{
            return String(describing: SingletonLists.roomList[row].roomName!)
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView == customerPicker){
            selectedCustomer = SingletonLists.customerList[row]
            print("lalala" ,selectedCustomer!.name!)
        }else{
            selectedRoom = SingletonLists.roomList[row]
            print(selectedRoom!.roomName!)
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

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
