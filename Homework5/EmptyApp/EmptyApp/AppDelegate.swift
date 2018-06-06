//
//  AppDelegate.swift
//  EmptyApp
//
//  Created by rab on 10/15/17.
//  Copyright © 2017 rab. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var response = 0
    var RoomList = [Room]()
    var CustomerList = [Customer]()
    var BookingList = [Booking]()
    var window: UIWindow?
    var selectedCustomer : Customer?
    var selectedRoom : Room?
    var previousButtonCustomer : UIButton?
    var previousButtonRoom : UIButton?

    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window {
            window.backgroundColor = UIColor.white
            window.rootViewController = UIViewController()
            window.makeKeyAndVisible()
            
            let c1 = Customer("Karan", "525 Newbury", IdType.drivers_license, 5253365, 6176376750)
            let c2 = Customer("abc", "123 apple", IdType.drivers_license, 989898, 12453265235)
            let c3 = Customer("zzz", "321 orange", IdType.passport, 3544545, 43543543)
            let c4 = Customer("ccc", "777 banana", IdType.state_id, 52349010, 547547434)
            addToCustomerList(c1)
            addToCustomerList(c2)
            addToCustomerList(c3)
            addToCustomerList(c4)
            
            //var roomList : [Room] = []
            let r1 = Room(Types.SingleOccupancy, 500)
            let r2 = Room(Types.DoubleOccupancy, 1000)
            let r3 = Room(Types.SingleOccupancy, 500)
            let r4 = Room(Types.DoubleOccupancy, 800)
            addToRoomList(r1)
            addToRoomList(r2)
            addToRoomList(r3)
            addToRoomList(r4)
            
            let swiftHotels = UILabel(frame: CGRect(x: 100, y: 50, width: 100, height: 50))
            swiftHotels.center = CGPoint(x:180, y: 50)
            swiftHotels.textAlignment = .center
            swiftHotels.text = "Swift Hotels!!!"
            
            let addCustomerButton = UIButton(frame: CGRect(x: -5, y: 100, width: (self.window?.frame.size.width)! + 5, height: 50))
            addCustomerButton.backgroundColor = .white
            addCustomerButton.setTitle("Add Customer", for: .normal)
            addCustomerButton.setTitleColor(.black, for: .normal)
            addCustomerButton.setTitleColor(.lightGray, for: .highlighted)
            addCustomerButton.layer.borderWidth = 0.5
            addCustomerButton.layer.borderColor = UIColor.black.cgColor
            addCustomerButton.addTarget(self, action: #selector(addCustomerWindow), for: .touchUpInside)
            
            let createRoomButton = UIButton(frame: CGRect(x: -5, y: 150, width: (self.window?.frame.size.width)! + 5, height: 50))
            createRoomButton.backgroundColor = .white
            createRoomButton.setTitle("Create Room", for: .normal)
            createRoomButton.setTitleColor(.black, for: .normal)
            createRoomButton.setTitleColor(.lightGray, for: .highlighted)
            createRoomButton.layer.borderWidth = 0.5
            createRoomButton.layer.borderColor = UIColor.black.cgColor
            createRoomButton.addTarget(self, action: #selector(createRoomWindow), for: .touchUpInside)
            
            let displayRoomsButton = UIButton(frame: CGRect(x: -5, y: 200, width: (self.window?.frame.size.width)! + 5, height: 50))
            displayRoomsButton.backgroundColor = .white
            displayRoomsButton.setTitle("Display Rooms", for: .normal)
            displayRoomsButton.setTitleColor(.black, for: .normal)
            displayRoomsButton.layer.borderWidth = 0.5
            displayRoomsButton.showsTouchWhenHighlighted = true
            displayRoomsButton.setTitleColor(.lightGray, for: .highlighted)
            displayRoomsButton.layer.borderColor = UIColor.black.cgColor
            displayRoomsButton.addTarget(self, action: #selector(displayRoomsWindow), for: .touchUpInside)
            
            
            let createBookingButton = UIButton(frame: CGRect(x: -5, y: 250, width: (self.window?.frame.size.width)! + 5, height: 50))
            createBookingButton.backgroundColor = .white
            createBookingButton.setTitle("Create Booking", for: .normal)
            createBookingButton.setTitleColor(.black, for: .normal)
            createBookingButton.layer.borderWidth = 1
            createBookingButton.layer.borderColor = UIColor.black.cgColor
            createBookingButton.addTarget(self, action: #selector(createBookingWindow), for: .touchUpInside)
            
            let displayBookingButton = UIButton(frame: CGRect(x: -5, y: 300, width: (self.window?.frame.size.width)! + 5, height: 50))
            displayBookingButton.backgroundColor = .white
            displayBookingButton.setTitle("Display Booking", for: .normal)
            displayBookingButton.setTitleColor(.black, for: .normal)
            displayBookingButton.layer.borderWidth = 1
            displayBookingButton.layer.borderColor = UIColor.black.cgColor
            displayBookingButton.addTarget(self, action: #selector(displayBookingWindow), for: .touchUpInside)
            
            let searchBookingButton = UIButton(frame: CGRect(x: -5, y: 350, width: (self.window?.frame.size.width)! + 5, height: 50))
            searchBookingButton.backgroundColor = .white
            searchBookingButton.setTitle("Search Booking", for: .normal)
            searchBookingButton.setTitleColor(.black, for: .normal)
            searchBookingButton.layer.borderWidth = 1
            searchBookingButton.layer.borderColor = UIColor.black.cgColor
            searchBookingButton.addTarget(self, action: #selector(searchBookingWindow), for: .touchUpInside)
            
            let deleteBookingButton = UIButton(frame: CGRect(x: -5, y: 400, width: (self.window?.frame.size.width)! + 5, height: 50))
            deleteBookingButton.backgroundColor = .white
            deleteBookingButton.setTitle("Delete Booking", for: .normal)
            deleteBookingButton.setTitleColor(.black, for: .normal)
            deleteBookingButton.layer.borderWidth = 1
            deleteBookingButton.layer.borderColor = UIColor.black.cgColor
            deleteBookingButton.addTarget(self, action: #selector(deleteBookingWindow), for: .touchUpInside)

            
            
            window.addSubview(addCustomerButton)
            window.addSubview(createRoomButton)
            window.addSubview(displayRoomsButton)
            window.addSubview(createBookingButton)
            window.addSubview(displayBookingButton)
            window.addSubview(searchBookingButton)
            window.addSubview(deleteBookingButton)
            window.addSubview(swiftHotels)
            
        }
        
        return true
    }
    
    func createBookingWindow(){
        let view : UIView = UIView(frame: (window?.bounds)!)
        view.backgroundColor = UIColor.white
        window?.addSubview(view)
//        init(_ Customer: Customer, _ FromDate: Date, _ ToDate: Date, _ Room: Room ){
        
        let custNameList = UILabel(frame: CGRect(x: 0, y: 80, width: 200, height: 20))
        custNameList.textAlignment = .left
        custNameList.text = "Select Customer"
        
        var yAxis = 0
        for cust in CustomerList{
            let custNameButton = UIButton(frame: CGRect(x: -5, y: 100 + yAxis, width: Int((self.window?.frame.size.width)! + 5), height: 20))
            custNameButton.backgroundColor = .white
            custNameButton.setTitle(cust.Name!, for: .normal)
            custNameButton.setTitleColor(.black, for: .normal)
            custNameButton.setTitleColor(.lightGray, for: .highlighted)
            custNameButton.layer.borderWidth = 0.5
            custNameButton.layer.borderColor = UIColor.black.cgColor
            custNameButton.addTarget(self, action: #selector(selectCustomer), for: .touchUpInside)
            
            view.addSubview(custNameButton)
            yAxis += 20
        }
        
        let RoomNameList = UILabel(frame: CGRect(x: 0, y: 110 + yAxis, width: 200, height: 20))
        RoomNameList.textAlignment = .left
        RoomNameList.text = "Select Room"
        view.addSubview(RoomNameList)
        yAxis += 30
        for room in RoomList{
            let roomNameButton = UIButton(frame: CGRect(x: -5, y: 100 + yAxis, width: Int((self.window?.frame.size.width)! + 5), height: 20))
            roomNameButton.backgroundColor = .white
            roomNameButton.setTitle(room.RoomName, for: .normal)
            roomNameButton.setTitleColor(.black, for: .normal)
            roomNameButton.setTitleColor(.lightGray, for: .highlighted)
            roomNameButton.layer.borderWidth = 0.5
            roomNameButton.layer.borderColor = UIColor.black.cgColor
            roomNameButton.addTarget(self, action: #selector(selectRoom), for: .touchUpInside)
            view.addSubview(roomNameButton)
            yAxis += 20
        }
        yAxis += 120
        let fromDate = UILabel(frame: CGRect(x: 10, y: yAxis, width: 190, height: 30))
        //        customerName.center = CGPoint(x:20, y: 90)
        fromDate.textAlignment = .left
        fromDate.text = "Enter From Date: "
        
        let textViewFromDate = UITextView(frame: CGRect(x: 210.0, y: Double(yAxis), width: 150.0, height: 30.0))
        textViewFromDate.textAlignment = NSTextAlignment.justified
        textViewFromDate.textColor = UIColor.blue
        textViewFromDate.text = "yyyy-MM-dd"
        textViewFromDate.tag = 7
        textViewFromDate.backgroundColor = UIColor.lightGray
        yAxis += 40
        let toDate = UILabel(frame: CGRect(x: 10, y: yAxis, width: 190, height: 30))
        //        customerName.center = CGPoint(x:20, y: 90)
        toDate.textAlignment = .left
        toDate.text = "Enter To Date: "
        
        let textViewToDate = UITextView(frame: CGRect(x: 210.0, y: Double(yAxis), width: 150.0, height: 30.0))
        textViewToDate.textAlignment = NSTextAlignment.justified
        textViewToDate.textColor = UIColor.blue
        textViewToDate.text = "yyyy-MM-dd"
        textViewToDate.tag = 8
        textViewToDate.backgroundColor = UIColor.lightGray
        
        let backButton = UIButton(frame: CGRect(x: 110, y: (self.window?.frame.size.height)! - 30, width: 70, height: 20))
        backButton.backgroundColor = .white
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.black, for: .normal)
        backButton.layer.borderWidth = 0.5
        backButton.showsTouchWhenHighlighted = true
        backButton.setTitleColor(.lightGray, for: .highlighted)
        backButton.layer.borderColor = UIColor.black.cgColor
        backButton.addTarget(self, action: #selector(closeCustomerWindow), for: .touchUpInside)
        
        let submitButton = UIButton(frame: CGRect(x: 210, y: (self.window?.frame.size.height)! - 30, width: 70, height: 20))
        submitButton.backgroundColor = .white
        submitButton.setTitle("Submit", for: .normal)
        submitButton.setTitleColor(.black, for: .normal)
        submitButton.layer.borderWidth = 0.5
        submitButton.showsTouchWhenHighlighted = true
        submitButton.setTitleColor(.lightGray, for: .highlighted)
        submitButton.layer.borderColor = UIColor.black.cgColor
        submitButton.addTarget(self, action: #selector(createBookingConstructor), for: .touchUpInside)
        
        view.addSubview(backButton)
        view.addSubview(custNameList)
        view.addSubview(submitButton)
        view.addSubview(fromDate)
        view.addSubview(textViewFromDate)
        view.addSubview(toDate)
        view.addSubview(textViewToDate)
        
    }
    
    func createBookingConstructor(){
        let dateToStr = window?.viewWithTag(7) as! UITextView?
        let dateFromStr = window?.viewWithTag(8) as! UITextView?
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" //Your date format
        let dateTo = dateFormatter.date(from: dateToStr!.text)
        let dateFrom = dateFormatter.date(from: dateFromStr!.text)
        let daysBetweenDates = calculateDaysBetweenTwoDates(start: dateTo!, end: dateFrom!);
        print(daysBetweenDates)
        if(daysBetweenDates > 1){
        if(checkIfRoomAvailableForDates(start: dateFrom!, end: dateTo!, room: selectedRoom!)){
        let booking = Booking(selectedCustomer!, dateFrom!, dateTo!, selectedRoom!)
        BookingList.append(booking)
        createAlert(titleText: "Booking Created", messageText: "YAYYY")
        }else{
            createAlert(titleText: "Duplicate Booking", messageText: "NAWWW")
            }
        }else if(daysBetweenDates == -1){
            createAlert(titleText: "NAWWW", messageText: "You can't make a booking in the past")
        }
        else{
            createAlert(titleText: "FAKE NEWS", messageText: "Please Select more than one day")
        }
    }
    
    func selectRoom(selecter : UIButton) {
        if let changeButtonColor = previousButtonRoom{
            changeButtonColor.backgroundColor = .white
        }
        selecter.backgroundColor = .red
        let button = selecter
        var room : Room?
        let roomStr = button.currentTitle
        for r in RoomList {
            if (r.RoomName == roomStr){
                room = r
                selectedRoom = room!
            }
        }
      previousButtonRoom = selecter
    }
    
    func validate(value: String) -> Bool {
        let PHONE_REGEX = "^\\d{10}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        
        return result
    }
    
    func selectCustomer(selecter : UIButton) {
        if let changeButtonRoomColor = previousButtonCustomer{
            changeButtonRoomColor.backgroundColor = .white
        }
//        print(selecter.tag)
        selecter.backgroundColor = .red
        let button = selecter
        var customer : Customer?
        let customerStr = button.currentTitle
        for cust in CustomerList {
            if (cust.Name == customerStr){
                customer = cust
                selectedCustomer = customer!
            }
        }
        previousButtonCustomer = selecter
    }
    
    func deleteBookingWindow(){
        let view1 : UIView = UIView(frame: (window?.bounds)!)
        view1.backgroundColor = UIColor.white
        window?.addSubview(view1)
        
        let swiftHotels = UILabel(frame: CGRect(x: 100, y: 50, width: 200, height: 50))
        swiftHotels.center = CGPoint(x:180, y: 50)
        swiftHotels.textAlignment = .center
        swiftHotels.text = "Display Bookings"
        
        var yAxis = 0
        for booking in BookingList{
            let roomNameButton = UIButton(frame: CGRect(x: -5, y: 100 + yAxis, width: Int((self.window?.frame.size.width)! + 5), height: 30))
            roomNameButton.backgroundColor = .white
            let dtf = DateFormatter()
            dtf.dateFormat = "yyyy-MM-dd"
            //            dtf.string(from: booking.FromDate)
            roomNameButton.setTitle(booking.BookingName!, for: .normal)
            roomNameButton.setTitleColor(.black, for: .normal)
            roomNameButton.setTitleColor(.lightGray, for: .highlighted)
            roomNameButton.layer.borderWidth = 0.5
            roomNameButton.layer.borderColor = UIColor.black.cgColor
            roomNameButton.addTarget(self, action: #selector(self.delB), for: .touchUpInside)
            
            view1.addSubview(roomNameButton)
            yAxis += 30
        }
        
        let backButton = UIButton(frame: CGRect(x: 110, y: 270, width: 70, height: 20))
        backButton.backgroundColor = .white
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.black, for: .normal)
        backButton.layer.borderWidth = 0.5
        backButton.showsTouchWhenHighlighted = true
        backButton.setTitleColor(.lightGray, for: .highlighted)
        backButton.layer.borderColor = UIColor.black.cgColor
        backButton.addTarget(self, action: #selector(closeCustomerWindow), for: .touchUpInside)
        
        view1.addSubview(swiftHotels)
        view1.addSubview(backButton)
    }
    
    func delB(sender:UIButton){
//        let nameVal = window?.viewWithTag(1) as? UITextField
        print(sender.currentTitle!)
        for b in BookingList{
            if((sender.currentTitle!) == b.BookingName){
                let p = BookingList.filter { $0 !== b }
                
                BookingList = p
            }
        }
        createAlert(titleText: "Deleted", messageText: "Booking Deleted Successfully")
        
        
    }
    
    func createRoomWindow(){
        let view : UIView = UIView(frame: (window?.bounds)!)
        view.backgroundColor = UIColor.white
        window?.addSubview(view)
        
        let swiftHotels = UILabel(frame: CGRect(x: 100, y: 50, width: 200, height: 50))
        swiftHotels.center = CGPoint(x:180, y: 50)
        swiftHotels.textAlignment = .center
        swiftHotels.text = "Create A Room"
        //        swiftHotels.font.fontName = .
        
        let roomType = UILabel(frame: CGRect(x: 10, y: 90, width: 190, height: 30))
        //        customerName.center = CGPoint(x:20, y: 90)
        roomType.textAlignment = .left
        roomType.text = "Enter Room Type: "
        
        let textViewRoomType = UITextView(frame: CGRect(x: 210.0, y: 90.0, width: 150.0, height: 30.0))
        textViewRoomType.textAlignment = NSTextAlignment.justified
        textViewRoomType.textColor = UIColor.blue
        textViewRoomType.tag = 5
        textViewRoomType.backgroundColor = UIColor.lightGray
        
        let Address = UILabel(frame: CGRect(x: 10, y: 130, width: 190, height: 30))
        //        customerName.center = CGPoint(x:20, y: 90)
        Address.textAlignment = .left
        Address.text = "Enter Price: "
        
        let textViewPrice = UITextView(frame: CGRect(x: 210.0, y: 130.0, width: 150.0, height: 30.0))
        textViewPrice.textAlignment = NSTextAlignment.justified
        textViewPrice.textColor = UIColor.blue
        textViewPrice.tag = 6
        textViewPrice.backgroundColor = UIColor.lightGray
        
        let backButton = UIButton(frame: CGRect(x: 110, y: 270, width: 70, height: 20))
        backButton.backgroundColor = .white
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.black, for: .normal)
        backButton.layer.borderWidth = 0.5
        backButton.showsTouchWhenHighlighted = true
        backButton.setTitleColor(.lightGray, for: .highlighted)
        backButton.layer.borderColor = UIColor.black.cgColor
        backButton.addTarget(self, action: #selector(closeCustomerWindow), for: .touchUpInside)
        
        let submitButton = UIButton(frame: CGRect(x: 210, y: 270, width: 70, height: 20))
        submitButton.backgroundColor = .white
        submitButton.setTitle("Submit", for: .normal)
        submitButton.setTitleColor(.black, for: .normal)
        submitButton.layer.borderWidth = 0.5
        submitButton.showsTouchWhenHighlighted = true
        submitButton.setTitleColor(.lightGray, for: .highlighted)
        submitButton.layer.borderColor = UIColor.black.cgColor
        submitButton.addTarget(self, action: #selector(addRoom), for: .touchUpInside)
        view.addSubview(swiftHotels)
        view.addSubview(roomType)
        view.addSubview(textViewRoomType)
        view.addSubview(Address)
        view.addSubview(textViewPrice)
        view.addSubview(backButton)
        view.addSubview(submitButton)

        
    }
    
    func searchBookingWindow(){
        let view : UIView = UIView(frame: (window?.bounds)!)
        view.backgroundColor = UIColor.white
        window?.addSubview(view)
        
        let searchDateButton = UIButton(frame: CGRect(x: -5, y: 100, width: (self.window?.frame.size.width)! + 5, height: 50))
        searchDateButton.backgroundColor = .white
        searchDateButton.setTitle("Search Booking by Date", for: .normal)
        searchDateButton.setTitleColor(.black, for: .normal)
        searchDateButton.layer.borderWidth = 1
        searchDateButton.showsTouchWhenHighlighted = true
        searchDateButton.setTitleColor(.lightGray, for: .highlighted)
        searchDateButton.layer.borderColor = UIColor.black.cgColor
        searchDateButton.addTarget(self, action: #selector(searchDateWindow), for: .touchUpInside)
        
        let searchNameButton = UIButton(frame: CGRect(x: -5, y: 200, width: (self.window?.frame.size.width)! + 5, height: 50))
        searchNameButton.backgroundColor = .white
        searchNameButton.setTitle("Search Booking by Name", for: .normal)
        searchNameButton.setTitleColor(.black, for: .normal)
        searchNameButton.layer.borderWidth = 1
        searchNameButton.layer.borderColor = UIColor.black.cgColor
        searchNameButton.showsTouchWhenHighlighted = true
        searchNameButton.setTitleColor(.lightGray, for: .highlighted)
        searchNameButton.addTarget(self, action: #selector(searchNameWindow), for: .touchUpInside)
        
        let backButton = UIButton(frame: CGRect(x: 110, y: (self.window?.frame.size.height)! - 30, width: 70, height: 20))
        backButton.backgroundColor = .white
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.black, for: .normal)
        backButton.layer.borderWidth = 0.5
        backButton.showsTouchWhenHighlighted = true
        backButton.setTitleColor(.lightGray, for: .highlighted)
        backButton.layer.borderColor = UIColor.black.cgColor
        backButton.addTarget(self, action: #selector(closeCustomerWindow), for: .touchUpInside)
        
        let submitButton = UIButton(frame: CGRect(x: 210, y: (self.window?.frame.size.height)! - 30, width: 70, height: 20))
        submitButton.backgroundColor = .white
        submitButton.setTitle("Submit", for: .normal)
        submitButton.setTitleColor(.black, for: .normal)
        submitButton.layer.borderWidth = 0.5
        submitButton.showsTouchWhenHighlighted = true
        submitButton.setTitleColor(.lightGray, for: .highlighted)
        submitButton.layer.borderColor = UIColor.black.cgColor
        submitButton.addTarget(self, action: #selector(createBookingConstructor), for: .touchUpInside)
        
        view.addSubview(searchDateButton)
        view.addSubview(searchNameButton)
        view.addSubview(submitButton)
        view.addSubview(backButton)
        //
//        if(numResponse == 1){
//            print("please enter the starting date yyyy-MM-dd")
//            let dateFormatter = DateFormatter()
//            let response = readLine()
//            dateFormatter.dateFormat = "yyyy-MM-dd" //Your date format
//            let date = dateFormatter.date(from: response!)
//            searchBookingDate(date: date!)
//        }else if(numResponse == 2){
//            print("please enter the name of the customer")
//            let response = readLine()
//            searchBooking(customer: response!)
//        }
    }
    
    func searchDateWindow(){
        let view : UIView = UIView(frame: (window?.bounds)!)
        view.backgroundColor = UIColor.white
        window?.addSubview(view)
        
        let fromDate = UILabel(frame: CGRect(x: 10, y: 150, width: 190, height: 30))
        //        customerName.center = CGPoint(x:20, y: 90)
        fromDate.textAlignment = .left
        fromDate.text = "Enter From Date: "
        
        let textViewFromDate = UITextView(frame: CGRect(x: 210.0, y: 150, width: 150.0, height: 30.0))
        textViewFromDate.textAlignment = NSTextAlignment.justified
        textViewFromDate.textColor = UIColor.blue
        textViewFromDate.text = "yyyy-MM-dd"
        textViewFromDate.tag = 15
        textViewFromDate.backgroundColor = UIColor.lightGray
        
        let backButton = UIButton(frame: CGRect(x: 110, y: (self.window?.frame.size.height)! - 30, width: 70, height: 20))
        backButton.backgroundColor = .white
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.black, for: .normal)
        backButton.layer.borderWidth = 0.5
        backButton.showsTouchWhenHighlighted = true
        backButton.setTitleColor(.lightGray, for: .highlighted)
        backButton.layer.borderColor = UIColor.black.cgColor
        backButton.addTarget(self, action: #selector(closeCustomerWindow), for: .touchUpInside)
        
        let submitButton = UIButton(frame: CGRect(x: 210, y: (self.window?.frame.size.height)! - 30, width: 70, height: 20))
        submitButton.backgroundColor = .white
        submitButton.setTitle("Submit", for: .normal)
        submitButton.setTitleColor(.black, for: .normal)
        submitButton.layer.borderWidth = 0.5
        submitButton.showsTouchWhenHighlighted = true
        submitButton.setTitleColor(.lightGray, for: .highlighted)
        submitButton.layer.borderColor = UIColor.black.cgColor
        submitButton.addTarget(self, action: #selector(displayBookingDateWindow), for: .touchUpInside)
        
        view.addSubview(fromDate)
        view.addSubview(textViewFromDate)
        view.addSubview(backButton)
        view.addSubview(submitButton)
        
    }
    
    func searchNameWindow(){
        let view : UIView = UIView(frame: (window?.bounds)!)
        view.backgroundColor = UIColor.white
        window?.addSubview(view)
        
        let fromDate = UILabel(frame: CGRect(x: 10, y: 150, width: 190, height: 30))
        //        customerName.center = CGPoint(x:20, y: 90)
        fromDate.textAlignment = .left
        fromDate.text = "Enter Name "
        
        let textViewFromDate = UITextView(frame: CGRect(x: 210.0, y: 150, width: 150.0, height: 30.0))
        textViewFromDate.textAlignment = NSTextAlignment.justified
        textViewFromDate.textColor = UIColor.blue
        textViewFromDate.text = ""
        textViewFromDate.tag = 16
        textViewFromDate.backgroundColor = UIColor.lightGray
        
        let backButton = UIButton(frame: CGRect(x: 110, y: (self.window?.frame.size.height)! - 30, width: 70, height: 20))
        backButton.backgroundColor = .white
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.black, for: .normal)
        backButton.layer.borderWidth = 0.5
        backButton.showsTouchWhenHighlighted = true
        backButton.setTitleColor(.lightGray, for: .highlighted)
        backButton.layer.borderColor = UIColor.black.cgColor
        backButton.addTarget(self, action: #selector(closeCustomerWindow), for: .touchUpInside)
        
        let submitButton = UIButton(frame: CGRect(x: 210, y: (self.window?.frame.size.height)! - 30, width: 70, height: 20))
        submitButton.backgroundColor = .white
        submitButton.setTitle("Submit", for: .normal)
        submitButton.setTitleColor(.black, for: .normal)
        submitButton.layer.borderWidth = 0.5
        submitButton.showsTouchWhenHighlighted = true
        submitButton.setTitleColor(.lightGray, for: .highlighted)
        submitButton.layer.borderColor = UIColor.black.cgColor
        submitButton.addTarget(self, action: #selector(displayBookingNameWindow), for: .touchUpInside)
        
        view.addSubview(fromDate)
        view.addSubview(textViewFromDate)
        view.addSubview(backButton)
        view.addSubview(submitButton)
    }
    
    func displayBookingNameWindow(){
        let view1 : UIView = UIView(frame: (window?.bounds)!)
        view1.backgroundColor = UIColor.white
        window?.addSubview(view1)
        print("FUCK YEAH BOIII NAWWWWW")
        for booking in BookingList{
            print("FUCK YEAH BOIII NAWWWWW")
            print(booking.ToDate!)
            let nameview = window?.viewWithTag(16) as! UITextView!
            let name = nameview?.text
            print(name!)
            let roomNameButton = UIButton(frame: CGRect(x: -5, y: 100, width: Int((self.window?.frame.size.width)! + 5), height: 30))
            roomNameButton.backgroundColor = .white
            let dtf = DateFormatter()
            dtf.dateFormat = "yyyy-MM-dd"
            print("YOYOYOYOYO")
            print(dtf.string(from: booking.ToDate!))
            print("NONONONON")
            print(name!)
            if(booking.Customer?.Name! == name){
                
                //            dtf.string(from: booking.FromDate)
                roomNameButton.setTitle(booking.BookingName! + " || " + dtf.string(from: booking.ToDate!) + " || " + dtf.string(from: booking.FromDate!) , for: .normal)
                roomNameButton.setTitleColor(.black, for: .normal)
                roomNameButton.setTitleColor(.lightGray, for: .highlighted)
                roomNameButton.layer.borderWidth = 0.5
                roomNameButton.layer.borderColor = UIColor.black.cgColor
                //            roomNameButton.addTarget(self, action: #selector(), for: .touchUpInside)
                view1.addSubview(roomNameButton)
            }
        }
        
        let backButton = UIButton(frame: CGRect(x: 110, y: (self.window?.frame.size.height)! - 30, width: 70, height: 20))
        backButton.backgroundColor = .white
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.black, for: .normal)
        backButton.layer.borderWidth = 0.5
        backButton.showsTouchWhenHighlighted = true
        backButton.setTitleColor(.lightGray, for: .highlighted)
        backButton.layer.borderColor = UIColor.black.cgColor
        backButton.addTarget(self, action: #selector(closeCustomerWindow), for: .touchUpInside)
        
        
        view1.addSubview(backButton)
    }
    
    func displayBookingDateWindow(){
        let view1 : UIView = UIView(frame: (window?.bounds)!)
        view1.backgroundColor = UIColor.white
        window?.addSubview(view1)
        print("FUCK YEAH BOIII NAWWWWW")
        for booking in BookingList{
            print("FUCK YEAH BOIII NAWWWWW")
            print(booking.ToDate!)
            let dateview = window?.viewWithTag(15) as! UITextView!
            let date = dateview?.text
            print(date!)
                let roomNameButton = UIButton(frame: CGRect(x: -5, y: 100, width: Int((self.window?.frame.size.width)! + 5), height: 30))
                roomNameButton.backgroundColor = .white
                let dtf = DateFormatter()
                dtf.dateFormat = "yyyy-MM-dd"
            print("YOYOYOYOYO")
            print(dtf.string(from: booking.ToDate!))
            print("NONONONON")
            print(date)
            if(dtf.string(from: booking.ToDate!) == date){
                
                //            dtf.string(from: booking.FromDate)
                roomNameButton.setTitle(booking.BookingName! + " || " + dtf.string(from: booking.ToDate!) + " || " + dtf.string(from: booking.FromDate!) , for: .normal)
                roomNameButton.setTitleColor(.black, for: .normal)
                roomNameButton.setTitleColor(.lightGray, for: .highlighted)
                roomNameButton.layer.borderWidth = 0.5
                roomNameButton.layer.borderColor = UIColor.black.cgColor
                //            roomNameButton.addTarget(self, action: #selector(), for: .touchUpInside)
                view1.addSubview(roomNameButton)
            }
        }
        
        let backButton = UIButton(frame: CGRect(x: 110, y: (self.window?.frame.size.height)! - 30, width: 70, height: 20))
        backButton.backgroundColor = .white
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.black, for: .normal)
        backButton.layer.borderWidth = 0.5
        backButton.showsTouchWhenHighlighted = true
        backButton.setTitleColor(.lightGray, for: .highlighted)
        backButton.layer.borderColor = UIColor.black.cgColor
        backButton.addTarget(self, action: #selector(closeCustomerWindow), for: .touchUpInside)
        
        
        view1.addSubview(backButton)
    }
    
    func displayBookingWindow(){
        let view1 : UIView = UIView(frame: (window?.bounds)!)
        view1.backgroundColor = UIColor.white
        window?.addSubview(view1)
        
        let swiftHotels = UILabel(frame: CGRect(x: 100, y: 50, width: 200, height: 50))
        swiftHotels.center = CGPoint(x:180, y: 50)
        swiftHotels.textAlignment = .center
        swiftHotels.text = "Display Bookings"
        
        var yAxis = 0
        for booking in BookingList{
            let roomNameButton = UIButton(frame: CGRect(x: -5, y: 100 + yAxis, width: Int((self.window?.frame.size.width)! + 5), height: 30))
            roomNameButton.backgroundColor = .white
            let dtf = DateFormatter()
            dtf.dateFormat = "yyyy-MM-dd"
//            dtf.string(from: booking.FromDate)
            roomNameButton.setTitle(booking.BookingName! + " || " + dtf.string(from: booking.ToDate!) + " || " + dtf.string(from: booking.FromDate!) , for: .normal)
            roomNameButton.setTitleColor(.black, for: .normal)
            roomNameButton.setTitleColor(.lightGray, for: .highlighted)
            roomNameButton.layer.borderWidth = 0.5
            roomNameButton.layer.borderColor = UIColor.black.cgColor
            //            roomNameButton.addTarget(self, action: #selector(), for: .touchUpInside)
            
            view1.addSubview(roomNameButton)
            yAxis += 30
        }
        
        let backButton = UIButton(frame: CGRect(x: 110, y: 270, width: 70, height: 20))
        backButton.backgroundColor = .white
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.black, for: .normal)
        backButton.layer.borderWidth = 0.5
        backButton.showsTouchWhenHighlighted = true
        backButton.setTitleColor(.lightGray, for: .highlighted)
        backButton.layer.borderColor = UIColor.black.cgColor
        backButton.addTarget(self, action: #selector(closeCustomerWindow), for: .touchUpInside)
        
        view1.addSubview(swiftHotels)
        view1.addSubview(backButton)
    }
    
    func displayRoomsWindow(){
        let view1 : UIView = UIView(frame: (window?.bounds)!)
        view1.backgroundColor = UIColor.white
        window?.addSubview(view1)
        
        let swiftHotels = UILabel(frame: CGRect(x: 100, y: 50, width: 200, height: 50))
        swiftHotels.center = CGPoint(x:180, y: 50)
        swiftHotels.textAlignment = .center
        swiftHotels.text = "Display Rooms"
        
        var yAxis = 0
        for room in RoomList{
            let roomNameButton = UIButton(frame: CGRect(x: -5, y: 100 + yAxis, width: Int((self.window?.frame.size.width)! + 5), height: 30))
            roomNameButton.backgroundColor = .white
            roomNameButton.setTitle(room.RoomName + " || " + String(describing: room.RoomType!) + " || " + String(describing: room.Price!) , for: .normal)
            roomNameButton.setTitleColor(.black, for: .normal)
            roomNameButton.setTitleColor(.lightGray, for: .highlighted)
            roomNameButton.layer.borderWidth = 0.5
            roomNameButton.layer.borderColor = UIColor.black.cgColor
//            roomNameButton.addTarget(self, action: #selector(), for: .touchUpInside)
            
            view1.addSubview(roomNameButton)
            yAxis += 30
        }
        
        let backButton = UIButton(frame: CGRect(x: 110, y: 270, width: 70, height: 20))
        backButton.backgroundColor = .white
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.black, for: .normal)
        backButton.layer.borderWidth = 0.5
        backButton.showsTouchWhenHighlighted = true
        backButton.setTitleColor(.lightGray, for: .highlighted)
        backButton.layer.borderColor = UIColor.black.cgColor
        backButton.addTarget(self, action: #selector(closeCustomerWindow), for: .touchUpInside)
        
        view1.addSubview(swiftHotels)
        view1.addSubview(backButton)
    }
    
    func addRoom(){
//        let roomType = window?.viewWithTag(5) as! UITextView?
//        let roomTypeStr = roomType?.text
        let roomPrice = window?.viewWithTag(6) as! UITextView?
        let roomPriceInt = Int((roomPrice?.text)!)
        let room = Room (Types.SingleOccupancy, roomPriceInt!)
        createAlert(titleText: "Room Created", messageText: "Successful")
        RoomList.append(room)
    }
    
    func addCustomerWindow(){
        let view : UIView = UIView(frame: (window?.bounds)!)
        view.backgroundColor = UIColor.white
        window?.addSubview(view)
        
        let swiftHotels = UILabel(frame: CGRect(x: 100, y: 50, width: 200, height: 50))
        swiftHotels.center = CGPoint(x:180, y: 50)
        swiftHotels.textAlignment = .center
        swiftHotels.text = "Add a Customer"
//        swiftHotels.font.fontName = .
        
        let customerName = UILabel(frame: CGRect(x: 10, y: 90, width: 190, height: 30))
//        customerName.center = CGPoint(x:20, y: 90)
        customerName.textAlignment = .left
        customerName.text = "Enter Customer Name: "
        
        let textViewName = UITextView(frame: CGRect(x: 210.0, y: 90.0, width: 150.0, height: 30.0))
        textViewName.textAlignment = NSTextAlignment.justified
        textViewName.textColor = UIColor.blue
        textViewName.tag = 1
        textViewName.backgroundColor = UIColor.lightGray
        
        let Address = UILabel(frame: CGRect(x: 10, y: 130, width: 190, height: 30))
        //        customerName.center = CGPoint(x:20, y: 90)
        Address.textAlignment = .left
        Address.text = "Enter Address: "
        
        let textViewAddress = UITextView(frame: CGRect(x: 210.0, y: 130.0, width: 150.0, height: 30.0))
        textViewAddress.textAlignment = NSTextAlignment.justified
        textViewAddress.textColor = UIColor.blue
        textViewAddress.tag = 2
        textViewAddress.backgroundColor = UIColor.lightGray
        
        let IDNumber = UILabel(frame: CGRect(x: 10, y: 170, width: 190, height: 30))
        //        customerName.center = CGPoint(x:20, y: 90)
        IDNumber.textAlignment = .left
        IDNumber.text = "Drivers License Number: "
        
        let textViewLicense = UITextView(frame: CGRect(x: 210.0, y: 170, width: 150.0, height: 30.0))
        textViewLicense.textAlignment = NSTextAlignment.justified
        textViewLicense.textColor = UIColor.blue
        textViewLicense.tag = 3
        textViewLicense.backgroundColor = UIColor.lightGray
        
        let PhoneNumber = UILabel(frame: CGRect(x: 10, y: 210, width: 190, height: 30))
        //        customerName.center = CGPoint(x:20, y: 90)
        PhoneNumber.textAlignment = .left
        PhoneNumber.text = "Phone Number: "
        
        let textViewPhone = UITextView(frame: CGRect(x: 210.0, y: 210.0, width: 150.0, height: 30.0))
        textViewPhone.textAlignment = NSTextAlignment.justified
        textViewPhone.textColor = UIColor.blue
        textViewPhone.tag = 4
        textViewPhone.backgroundColor = UIColor.lightGray
        
        let backButton = UIButton(frame: CGRect(x: 110, y: 270, width: 70, height: 20))
        backButton.backgroundColor = .white
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.black, for: .normal)
        backButton.layer.borderWidth = 0.5
        backButton.showsTouchWhenHighlighted = true
        backButton.setTitleColor(.lightGray, for: .highlighted)
        backButton.layer.borderColor = UIColor.black.cgColor
        backButton.addTarget(self, action: #selector(closeCustomerWindow), for: .touchUpInside)
        
        let submitButton = UIButton(frame: CGRect(x: 210, y: 270, width: 70, height: 20))
        submitButton.backgroundColor = .white
        submitButton.setTitle("Submit", for: .normal)
        submitButton.setTitleColor(.black, for: .normal)
        submitButton.layer.borderWidth = 0.5
        submitButton.showsTouchWhenHighlighted = true
        submitButton.setTitleColor(.lightGray, for: .highlighted)
        submitButton.layer.borderColor = UIColor.black.cgColor
        submitButton.addTarget(self, action: #selector(addCustomer), for: .touchUpInside)
        
        view.addSubview(textViewName)
        view.addSubview(customerName)
        view.addSubview(Address)
        view.addSubview(textViewAddress)
        view.addSubview(IDNumber)
        view.addSubview(textViewLicense)
        view.addSubview(PhoneNumber)
        view.addSubview(textViewPhone)
        view.addSubview(backButton)
        view.addSubview(swiftHotels)
        view.addSubview(submitButton)
        
    }
    
    func createAlert(titleText: String, messageText: String){
        let alert = UIAlertView()
        alert.addButton(withTitle: "OKAY")
        alert.title = titleText
        alert.message = messageText
        alert.show()
//        self.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    func closeCustomerWindow(sender: UIButton){
        let parentWin: UIView = sender.superview!;
        parentWin.removeFromSuperview()
    }
    
    func addCustomer(){
        let custName = window?.viewWithTag(1) as! UITextView?
        let name = custName?.text
        let custAdd = window?.viewWithTag(2) as! UITextView?
        let address = custAdd?.text
        let custLicense = window?.viewWithTag(3) as! UITextView?
        let licenseNumber = Int((custLicense?.text)!)
        let custPhone = window?.viewWithTag(4) as! UITextView?
        let phoneNumberInt = Int((custPhone?.text)!)
        if(self.validate(value: (custPhone?.text)!) == true){
        let customer = Customer(name!, address!, IdType.drivers_license, licenseNumber!, phoneNumberInt!)
        addToCustomerList(customer)
        createAlert(titleText: "Customer Added Successfully", messageText: "Horray!")
        }else{
          createAlert(titleText: "Please Check your phone number", messageText: "Nawww!")
        }
        
        
    }
    
    
    
    func addToCustomerList(_ customer: Customer){
        CustomerList.append(customer);
    }
    
    //  Pre populated data

    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func addToBookingList(_ booking: Booking){
        BookingList.append(booking)
    }
    
    func addToRoomList(_ room: Room){
        RoomList.append(room);
        //        displayRooms();
    }
    
    
    
    func checkResponse(){
        switch response {
        case 1:
            //1.	AddCustomer: Allow the user to create a new customer with the specific details.
            print("Please Enter the name of the customer")
            let name = readLine()
            
            print("Please enter the 🏡 address of the customer")
            let address = readLine()
            
            print("Please select from the following Id types")
            print("    1. Drivers License")
            print("    2. State ID")
            print("    3. Passport")
            let idType = readLine()
            let idTypeNum = Int(idType!)
            var idTypeEnum : IdType?
            if(idTypeNum == 1){
                idTypeEnum = IdType.drivers_license
                print("Please enter 🚗 ID number")
            }else if(idTypeNum == 2){
                idTypeEnum = IdType.state_id
                print("Please enter 🇺🇸 ID")
            }else if(idTypeNum == 3){
                idTypeEnum = IdType.passport
                print("Please Enter passport Serial number 🛂")
            }
            let licenseNumberStr = readLine()
            let licenseNumber = Int(licenseNumberStr!)
            
            print("Please enter the 📱 number of the customer")
            let phoneNumber = readLine()
            let phoneNumberInt = Int(phoneNumber!)
            
            let customer = Customer(name!, address!, idTypeEnum!, licenseNumber!, phoneNumberInt!)
            addToCustomerList(customer)
            //        print(customer.toString())
//            askUser();
            break
        case 2:
            //2.	CreateRoom: Allow user to create a room which can be booked for a customer
            print("Please select the type of Room")
            print("    1. Single Occupancy")
            print("    2. Double Occupancy")
            let typeOfRoom = readLine()
            let roomTypeInt = Int(typeOfRoom!)
            var roomTypeEnum : Types?
            if(roomTypeInt == 1){
                roomTypeEnum = Types.SingleOccupancy
            }else if(roomTypeInt == 2){
                roomTypeEnum = Types.DoubleOccupancy
            }
            print("Enter the ＄ of Room")
            let price = readLine()
            let priceInt = Int(price!)
            _ = Room(roomTypeEnum!, priceInt!)
            print()
//            askUser();
            break
        case 3:
            //    3.	DisplayRooms: Display all rooms details occupied and vacant
//            displayRooms();
//            askUser();
            break
        case 4:
            //4.	CreateBooking: Allow the user to create a booking for a room
            if(RoomList.count != 0 && CustomerList.count != 0){
                print("Please select a customer to create a booking")
//                displayCustomers();
                let response = readLine()
                let customerNum = Int(response!)
                let selectedCustomer = CustomerList[customerNum! - 1]
//                displayRooms()
                print("Please select a room to create a booking")
                let roomResponse = readLine()
                let roomNum = Int(roomResponse!)!
                let selectedRoom = RoomList[roomNum - 1]
                print("Please Enter From Date yyyy-MM-dd")
                let dateStr = readLine()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd" //Your date format
                let date = dateFormatter.date(from: dateStr!)
                print("Please Enter To Date yyyy-MM-dd")
                let dateStr1 = readLine()
                dateFormatter.dateFormat = "yyyy-MM-dd" //Your date format
                let dateTo = dateFormatter.date(from: dateStr1!)
                let daysBetweenDates = calculateDaysBetweenTwoDates(start: date!, end: dateTo!);
                print("I am days between two dates YAY" , daysBetweenDates)
                if(daysBetweenDates > 1){
                    if(checkIfRoomAvailableForDates(start: date!, end: dateTo!, room: selectedRoom)){
                        let booking = Booking(selectedCustomer, date!, dateTo!, selectedRoom)
                        addToBookingList(booking);
                    }
                }else{
                    print("Make a booking for atleast one day")
                }
            }else{
                print("Please create a Customer and Room First")
                print()
            }
//            askUser();
            break
        case 5:
//            displayBookings()
//            askUser();
            break
        case 6:
            print("Do you want to search using:")
            print("1.   Date")
            print("2.   Customer Name")
            let response = readLine()
            
            let numResponse = Int(response!)
            if(numResponse == 1){
                print("please enter the starting date yyyy-MM-dd")
                let dateFormatter = DateFormatter()
                let response = readLine()
                dateFormatter.dateFormat = "yyyy-MM-dd" //Your date format
                let date = dateFormatter.date(from: response!)
                searchBookingDate(date: date!)
            }else if(numResponse == 2){
                print("please enter the name of the customer")
                let response = readLine()
                searchBooking(customer: response!)
            }
//            askUser()
            break
        case 7:
            //7. DeleteBooking: Delete a booking.
            print("Please Select a booking")
//            displayBookings()
            let selectedBooking = readLine()
            let selectedBookingInt = Int(selectedBooking!)
            deleteBooking(selectedBookingInt!)
//            askUser()
            break
        case 8:
            print("Here is your 'Gift?' , Go Ahead unwrap 'it!'")
            print("---------------------------------------------")
            print("Thank you for using the application")
            break
        default:
            print("Please enter  valid number between 1 - 7")
            print()
//            askUser()
        }
        
    }
    
    func searchBooking(customer : String){
        var flag : Bool = false;
        for booking in BookingList{
            if(booking.Customer?.Name == customer){
                print(booking.BookingName!)
                flag = false;
                break;
            }else{
                //            print("no bookings found")
                flag = true;
            }
        }
        if(flag == true){
            print("no booking found");
        }
    }
    
    func searchBookingDate(date: Date){
        var flag : Bool = false;
        for booking in BookingList{
            if(booking.FromDate == date) {
                print(booking.BookingName!);
                flag = false;
                break;
            }else{
                //            print("no bookings found")
                flag = true;
            }
        }
        if(flag == true){
            print("no bookings found")
        }
    }
    
    func deleteBooking(_ bookingInt : Int){
        print(bookingInt)
        BookingList.remove(at: bookingInt)
        
        let room = BookingList[bookingInt].Room
        room?.roomBooked = IsRoomBooked.Available
        let customer = BookingList[bookingInt].Customer
        customer?.IsRoomReserved = RoomReservedEnum.NotReserved
        print("Removed the booking")
        print()
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
    
    func checkIfRoomAvailableForDates(start: Date, end: Date, room: Room) -> Bool{
        print("i am trying new booking for this room " ,room.RoomName)
        for b in BookingList{
            if(b.Room?.RoomName == room.RoomName){
                if(start == b.FromDate || end == b.ToDate){
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
    

    
}

