////
////  Customer.swift
////  Assignment4
////
////  Created by karan magdani on 2/15/18.
////  Copyright © 2018 karan magdani. All rights reserved.
////
//
import Foundation

enum RoomReservedEnum{
    case Reserved
    case NotReserved
}
enum IdType{
    case drivers_license 
    case state_id
    case passport
}
//
//class Customer{
//    //    Address, Id number, phone number
//    static var staticIndex = 1;
//    var Name: String?;
//    var Address: String?;
//    var IdNumber: Int?;
//    var idType: IdType;
//    var PhoneNo: Int?;
//    var customerNumber: Int?
//    var IsRoomReserved : RoomReservedEnum?
//    
//    init(_ Name: String, _ Address: String, _ idType: IdType, _ IdNumber: Int, _ PhoneNo: Int ){
//        self.customerNumber = Customer.staticIndex;
//        self.Name = Name;
//        self.Address = Address;
//        self.IdNumber = IdNumber;
//        self.PhoneNo = PhoneNo;
//        self.idType = idType;
//        self.IsRoomReserved = RoomReservedEnum.NotReserved;
//        Customer.staticIndex += 1;
//    }
//    
//    func toString() -> String{
//        return "Name ==> " + Name! + "\nAddress ==> " + Address! + "\nLicense Number " + String(describing: IdNumber!) + "\n📱 number " + String(describing: PhoneNo!)
//    }
//}

