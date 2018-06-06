////
////  Booking.swift
////  Assignment4
////
////  Created by karan magdani on 2/15/18.
////  Copyright © 2018 karan magdani. All rights reserved.
////
//
import Foundation
//
class Booking{
//    //     bookingName, fromDate, toDate, Customer, Room,
    static var bookingNumber = 1
    var BookingName: String?
    var FromDate: Date?
    var ToDate: Date?
    var bookNumber: Int?
    var Rooms: Rooms?
    var Customer: Customers?;
//    
//    init(_ Customer: Customers, _ FromDate: Date, _ ToDate: Date, _ Rooms: Rooms ){
//        self.bookNumber = Booking.bookingNumber;
//        self.Customer = Customer;
//        Customer.isRoomReserved = Int16(RoomReservedEnum.Reserved.hashValue)
//        self.FromDate = FromDate;
//        self.ToDate = ToDate;
//        self.Rooms = Rooms;
//        if(Rooms.roomType == Types.DoubleOccupancy){
//            if(Rooms.roomBooked == IsRoomBooked.Available){
//                    Rooms.roomBooked = IsRoomBooked.OneBedBooked
//            }else if(Rooms.roomBooked == IsRoomBooked.OneBedBooked){
//                    Rooms.roomBooked = IsRoomBooked.Booked
//            }
//        }else{
//            Rooms.roomBooked = IsRoomBooked.Booked
//        }
//        let BookingId: String? = String((self.Customer?.idNumber)!)
//        self.BookingName = (self.Customer?.name)! + BookingId!
//        Booking.bookingNumber += 1;
//    }
}

