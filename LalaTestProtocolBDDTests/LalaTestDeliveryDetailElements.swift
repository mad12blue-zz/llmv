//
//  File.swift
//  LalaTestProtocolBDDTests
//
//  Created by Madhan on 07/10/18.
//  Copyright © 2018 Kenneth. All rights reserved.
//

import Foundation
import XCTest

//ALL EMELEMENTS OF THE DELIVERY DETAIL SCREEN

enum DeliveryDetailElements {
    
    static let app = XCUIApplication();
    static let deliveryDetailNavigationBar = app.navigationBars["Delivery Detail"]
    static let deliveryDetailNavigationBarBack = app.navigationBars["Delivery Detail"].buttons["Back"]
    static let deliveryDetailDescription = app/*@START_MENU_TOKEN@*/.staticTexts["DeliveryCellTitle"]/*[[".staticTexts[\"Deliver wine to Kenneth\"]",".staticTexts[\"DeliveryCellTitle\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    static let deliveryDetailLocation = app/*@START_MENU_TOKEN@*/.staticTexts["DeliveryCellSubtitle"]/*[[".staticTexts[\"Mong Kok\"]",".staticTexts[\"DeliveryCellSubtitle\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    static let predicate = NSPredicate(format: "label BEGINSWITH 'Gale or storm force wind is expected or blowing generally in Hong Kong near sea level, with a sustained wind speed of 63–117 km/h from the quarter indicated and gusts which may exceed 180 km/h, and the wind condition is expected to persist.'")
    static let deliveryDetailTyphoonWarning = app.staticTexts.element(matching: predicate)
    
    static let mapPin = app.otherElements.containing(.navigationBar, identifier:"Delivery Detail").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
    
    //static let co = mapPin.coordinate(withNormalizedOffset: CGVector)
}
