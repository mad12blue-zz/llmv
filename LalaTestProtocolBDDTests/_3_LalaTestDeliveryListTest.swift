//
//  LalaTestDeliveryListTest.swift
//  LalaTestProtocolBDDTests
//
//  Created by Madhan on 05/10/18.
//  Copyright © 2018 Kenneth. All rights reserved.
//

import XCTest

class _3_LalaTestDeliveryListTest: XCTestCase, Feature {
    
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
    
    func test_1_ItemsOnDeliveryListOnLoad() {
        givenIamOnTheDeliveryListScreen()
        thenIShouldSeeTheDeliveryList()
        thenIShouldSee20ItemsInTheDeliveryList()
    }
    
    func test_2_IconDescriptionLocationOfDeliveryItems() {
        givenIamOnTheDeliveryListScreen()
        thenIShouldSeeTheDeliveryList()
        thenIShouldSeeForDeliveryListItemTheComponents(items: 3, components: ["icon","description","location"])
    }
    
    func test_3_DescriptionTypeAndToOfDeliveryItems() {
        givenIamOnTheDeliveryListScreen()
        thenIShouldSeeTheDeliveryList()
        thenIShouldSeeDescriptionOfEveryDeliveryListItemTheItemTypeAndItemTo(itemType: "documents", itemTo: "Andrio")
        thenIShouldSeeDescriptionOfEveryDeliveryListItemTheItemTypeAndItemTo(itemType: "parcel", itemTo: "Leviero")
    }
    
    func test_4_ItemsOnDeliveryListOnScroll() {
        givenIamOnTheDeliveryListScreen()
        whenIScrollUpTillTheLastItemInDeliveryList()
        thenIShouldSee20ItemsAddedInTheDeliveryList()
        whenIScrollUpTillTheLastItemInDeliveryList()
        thenIShouldSee20ItemsAddedInTheDeliveryList()
    }
    
    func test_5_DeleteItemFromDeliveryList() {
        givenIamOnTheDeliveryListScreen()
        whenILongPressOnADeliveryItem()
        thenThatItemGetsDeletedFromTheDeliveryList()
    }
}

