//
//  DeliveryListSteps.swift
//  LalaTestProtocolBDDTests
//
//  Created by Madhan on 05/10/18.
//  Copyright © 2018 Kenneth. All rights reserved.
//

import Foundation
import XCTest

extension Feature {
    
    func whenITapOnBackButton() {
        DeliveryDetailElements.deliveryDetailNavigationBarBack.tap()
    }
    
    func thenIShouldSeeTheItemOpenedInDetailView() {
        XCTAssertTrue(DeliveryDetailElements.deliveryDetailNavigationBar.waitForExistence(timeout: defaultTimeout))
        XCTAssertTrue(DeliveryDetailElements.deliveryDetailNavigationBarBack.waitForExistence(timeout: defaultTimeout))
    }
    
    func thenIShouldSeeItemDescriptionSameAsInTheListView() {
        XCTAssert(DeliveryDetailElements.deliveryDetailDescription.value as! String == itemDesc)
    }
    
    func thenIShouldSeeItemLocationSameAsInTheListView() {
        XCTAssert(DeliveryDetailElements.deliveryDetailLocation.value as! String == itemLoc)
    }
    
    func thenIShouldSeeTheTyphoonWarningShownInDetailView() {
        XCTAssertTrue(DeliveryDetailElements.deliveryDetailTyphoonWarning.waitForExistence(timeout: defaultTimeout))
    }
    
    func thenIShouldSeeThePinOnTheMap() {
        XCTAssertTrue(DeliveryDetailElements.mapPin.waitForExistence(timeout: defaultTimeout))
    }
    
    func thenIShouldSeeThePinInTheMiddleOfTheMap() {
        XCTAssertTrue(DeliveryDetailElements.mapPin.frame.origin.x == 0.0)
        XCTAssertTrue(DeliveryDetailElements.mapPin.frame.origin.y == 88.0)
    }
}


