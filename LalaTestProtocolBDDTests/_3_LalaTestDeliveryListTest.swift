//
//  LalaTestDeliveryListTest.swift
//  LalaTestProtocolBDDTests
//
//  Created by Madhan on 05/10/18.
//  Copyright © 2018 Kenneth. All rights reserved.
//

import XCTest

//TESTS TO VERIFY THE DELIVERY LIST VIEW

class _3_LalaTestDeliveryListTest: XCTestCase, Feature {
    
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
    
    //TEST TO VERIFY THE DELIVERY LIST LOAD
    func test_1_ItemsOnDeliveryListOnLoad() {
        givenIamOnTheDeliveryListScreen()
        thenIShouldSeeTheDeliveryList()
        thenIShouldSee20ItemsInTheDeliveryList()
    }
    
    //TEST TO VERIFY THE ICON/DESCRIPTION/LOCATION OF THE DELIVERY ITEMS
    func test_2_IconDescriptionLocationOfDeliveryItems() {
        givenIamOnTheDeliveryListScreen()
        thenIShouldSeeTheDeliveryList()
        thenIShouldSeeForDeliveryListItemTheComponents(items: 3, components: ["icon","description","location"])
    }
    
    //TEST TO VERIFY THE 'ITEM TYPE - DELIVERY TO' COMBINATION
    func test_3_DescriptionTypeAndToOfDeliveryItems() {
        givenIamOnTheDeliveryListScreen()
        thenIShouldSeeTheDeliveryList()
        thenIShouldSeeDescriptionOfEveryDeliveryListItemTheItemTypeAndItemTo(itemType: "documents", itemTo: "Andrio")
        thenIShouldSeeDescriptionOfEveryDeliveryListItemTheItemTypeAndItemTo(itemType: "parcel", itemTo: "Leviero")
    }
    
    //TEST TO VERIFY NEWER ITEMS LOAD ON SCROLL
    func test_4_ItemsOnDeliveryListOnScroll() {
        givenIamOnTheDeliveryListScreen()
        whenIScrollUpTillTheLastItemInDeliveryList()
        thenIShouldSee20ItemsAddedInTheDeliveryList()
        whenIScrollUpTillTheLastItemInDeliveryList()
        thenIShouldSee20ItemsAddedInTheDeliveryList()
    }
    
    //TEST TO VERIFY DELETE OF ITEM FROM THE DELIVERY LIST
    func test_5_DeleteItemFromDeliveryList() {
        givenIamOnTheDeliveryListScreen()
        whenILongPressOnADeliveryItem()
        thenThatItemGetsDeletedFromTheDeliveryList()
    }
}

