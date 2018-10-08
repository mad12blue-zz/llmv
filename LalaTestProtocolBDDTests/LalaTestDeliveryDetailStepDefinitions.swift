//
//  DeliveryListSteps.swift
//  LalaTestProtocolBDDTests
//
//  Created by Madhan on 05/10/18.
//  Copyright © 2018 Kenneth. All rights reserved.
//

import Foundation
import XCTest

//STEP DEFINITION IMPLEMENTATION FOR DELIVERY DETAILS SCREEN

extension Feature {
    
    //GIVEN THE USER IS ON THE DELIVERY DETAILS SCREEN
    func givenIamOnTheDeliveryDetailsScreen() {
        XCTAssertTrue(DeliveryListElements.deliveryList.waitForExistence(timeout: defaultTimeout))
        itemDesc = (DeliveryListElements.deliveriestableviewTableElementDescription(itemNumber: 1).value as! String)
        itemLoc = (DeliveryListElements.deliveriestableviewTableElementLocation(itemNumber: 1).value as! String)
        DeliveryListElements.deliveriestableviewTableElement(itemNumber: 1).tap()
    }
    
    //WHEN THE USER TAPS ON BACK BUTTON
    func whenITapOnBackButton() {
        DeliveryDetailElements.deliveryDetailNavigationBarBack.tap()
    }
    
    //THEN THE USER SEES THE ITEM OPENEND IN DETAIL VIEW
    func thenIShouldSeeTheItemOpenedInDetailView() {
        XCTAssertTrue(DeliveryDetailElements.deliveryDetailNavigationBar.waitForExistence(timeout: defaultTimeout))
        XCTAssertTrue(DeliveryDetailElements.deliveryDetailNavigationBarBack.waitForExistence(timeout: defaultTimeout))
    }
    
    //THEN THE USER SEES THE ITEMS DESCRIPTION SAME AS IN THE LIST VIEW
    func thenIShouldSeeItemDescriptionSameAsInTheListView() {
        XCTAssert(DeliveryDetailElements.deliveryDetailDescription.value as! String == itemDesc)
    }
    
    //THEN THE USER SEES THE DELIVERY LOCATION SAME AS SEEN IN THE LIST VIEW
    func thenIShouldSeeItemLocationSameAsInTheListView() {
        XCTAssert(DeliveryDetailElements.deliveryDetailLocation.value as! String == itemLoc)
    }
    
    //THEN THE USER SEES TEH TYPHOON WARNING SHOWN IN THE DETAIL VIEW
    func thenIShouldSeeTheTyphoonWarningShownInDetailView() {
        XCTAssertTrue(DeliveryDetailElements.deliveryDetailTyphoonWarning.waitForExistence(timeout: defaultTimeout))
    }
    
    //THEN THE USER SEES THE PIN ON THE MAP
    func thenIShouldSeeThePinOnTheMap() {
        XCTAssertTrue(DeliveryDetailElements.mapPin.waitForExistence(timeout: defaultTimeout))
    }
    
    //THEN THE USER SEES THE MAP PIN IN THE MIDDLE OF THE MAP
    func thenIShouldSeeThePinInTheMiddleOfTheMap() {
        XCTAssertTrue(DeliveryDetailElements.mapPin.frame.origin.x == 0.0)
        XCTAssertTrue(DeliveryDetailElements.mapPin.frame.origin.y == 88.0)
    }
}


