//
//  LalaTestDeliveryListTest.swift
//  LalaTestProtocolBDDTests
//
//  Created by Madhan on 05/10/18.
//  Copyright © 2018 Kenneth. All rights reserved.
//

import XCTest

//TESTS TO VERIFY THE DELIVERY DETAIL VIEW

class _2_LalaTestDeliveryDetailTest: XCTestCase, Feature {
    
    //SETUP
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        givenILaunchTheApp()
    }
    
    //TEAR DOWN
    override func tearDown() {
        thenICloseTheApp()
        //Springboard.deleteApp()
        super.tearDown()        
    }
    
    //TEST TO NAVIGATE TO THE DELIVERY DETAIL VIEW
    func test_1_NavigateToDeliveryDetails() {
        givenIamOnTheDeliveryListScreen()
        whenITapOnADeliveryItem()
        thenIShouldSeeTheItemOpenedInDetailView()
        thenIShouldSeeItemDescriptionSameAsInTheListView()
        thenIShouldSeeItemLocationSameAsInTheListView()
    }
    
    //TEST TO NAVIGATE BACK TO DELIVERY LIST FROM DELIVERY DETAIL VIEW
    func test_2_NavigateBackToDeliveryListFromDeliveryDetails() {
        givenIamOnTheDeliveryDetailsScreen()
        thenIShouldSeeTheItemOpenedInDetailView()
        whenITapOnBackButton()
        thenIShouldSeeTheDeliveryList()
    }
    
    //TEST TO VERIFY THE MAP SHOWN IN THE DELIVERY DETAIL VIEW
    func test_3_MapInDetailView() {
        givenIamOnTheDeliveryDetailsScreen()
        thenIShouldSeeTheItemOpenedInDetailView()
        thenIShouldSeeThePinOnTheMap()
        thenIShouldSeeThePinInTheMiddleOfTheMap()
    }
    
    //TEST TO NAVIGATE TO THE 14TH DELIVERY ITEM AND VERIFY THE TYPHOON WARNING SHOWN
    func test_4_NavigateToDeliveryDetailsOf14thItem() {
        givenIamOnTheDeliveryListScreen()
        whenITapOn14thDeliveryItem()
        thenIShouldSeeTheTyphoonWarningShownInDetailView()
    }
}

