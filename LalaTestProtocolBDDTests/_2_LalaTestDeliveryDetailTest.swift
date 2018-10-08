//
//  LalaTestDeliveryListTest.swift
//  LalaTestProtocolBDDTests
//
//  Created by Madhan on 05/10/18.
//  Copyright © 2018 Kenneth. All rights reserved.
//

import XCTest

class _2_LalaTestDeliveryDetailTest: XCTestCase, Feature {
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        givenILaunchTheApp()
    }
    
    override func tearDown() {
        thenICloseTheApp()
        //Springboard.deleteApp()
        super.tearDown()        
    }
    
    func test_1_NavigateToDeliveryDetails() {
        givenIamOnTheDeliveryListScreen()
        whenITapOnADeliveryItem()
        thenIShouldSeeTheItemOpenedInDetailView()
        thenIShouldSeeItemDescriptionSameAsInTheListView()
        thenIShouldSeeItemLocationSameAsInTheListView()
    }
    
    func test_2_NavigateBackToDeliveryListFromDeliveryDetails() {
        givenIamOnTheDeliveryListScreen()
        whenITapOnADeliveryItem()
        thenIShouldSeeTheItemOpenedInDetailView()
        whenITapOnBackButton()
        thenIShouldSeeTheDeliveryList()
    }
    
    func test_3_MapInDetailView() {
        givenIamOnTheDeliveryListScreen()
        whenITapOnADeliveryItem()
        thenIShouldSeeTheItemOpenedInDetailView()
        thenIShouldSeeThePinOnTheMap()
        thenIShouldSeeThePinInTheMiddleOfTheMap()
    }
    
    func test_4_NavigateToDeliveryDetailsOf14thItem() {
        givenIamOnTheDeliveryListScreen()
        whenITapOn14thDeliveryItem()
        thenIShouldSeeTheTyphoonWarningShownInDetailView()
    }
}

