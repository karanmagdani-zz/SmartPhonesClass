//
//  SingletonLists.swift
//  Assignment6
//
//  Created by karan magdani on 3/16/18.
//  Copyright © 2018 karan magdani. All rights reserved.
//

import UIKit

class SingletonLists: NSObject {
    static var customerList: [Customers] = []
    static var roomList : [Rooms] = []
    static var bookList : [Bookings] = []
    
    class func addToCustomerList(newCust:Customers){
                SingletonLists.customerList.append(newCust)
                print("NEW CUSTOMER ADDED "+newCust.name!)
            }
        
            class func addRoom(newRoom:Rooms){
                SingletonLists.roomList.append(newRoom)
                print("NEW ROOM ADDED ",
                    newRoom.price)
            }
        
            class func addBooking(newBooking:Bookings){
                SingletonLists.bookList.append(newBooking)
                print("NEW BOOKING ADDED ",
                    newBooking.bookingName!)
            }
    
    class func createAlert(titleText: String, messageText: String){
        let alert = UIAlertView()
        alert.addButton(withTitle: "OKAY")
        alert.title = titleText
        alert.message = messageText
        alert.show()
        //        self.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    

    
    //var roomList : [Room] = []


    
}


////  SingetonClass.swift
////  Assignment 6
////
////  Created by Megan Dsouza on 3/3/18.
////  Copyright © 2018 Megan Dsouza. All rights reserved.
////
//
//import UIKit
//
//class SingetonClass: NSObject {
//    static var customerList: [Customer] = []
//    static var roomList : [Room] = []
//    static var bookList : [Booking] = []
//    
//    
//    
//    class func addCustomer(newCust:Customer){
//        SingetonClass.customerList.append(newCust)
//        print(“NEW CUSTOMER ADDED “+newCust.Name)
//    }
//    
//    class func addRoom(newRoom:Room){
//        SingetonClass.roomList.append(newRoom)
//        print(“NEW ROOM ADDED “,
//            newRoom.price)
//    }
//    
//    class func addBookinh(newBooking:Booking){
//        SingetonClass.bookList.append(newBooking)
//        print(“NEW BOOKING ADDED “,
//            newBooking.bookingName)
//    }
//    
//    
//    
//    
//}
//Message Input
//
//Message @megandsouza
