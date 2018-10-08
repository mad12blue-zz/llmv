//
//  DeliveryListSteps.swift
//  LalaTestProtocolBDDTests
//
//  Created by Madhan on 05/10/18.
//  Copyright © 2018 Kenneth. All rights reserved.
//

import Foundation
import XCTest

var currCount = 20
var totalCount = 0
var itemDesc = ""
var itemLoc = ""

var itemLikeCount = 0

extension Feature {
    
    func givenIamOnTheDeliveryListScreen() {
        XCTAssertTrue(DeliveryListElements.deliveryList.waitForExistence(timeout: defaultTimeout))
    }
    
    func whenIScrollUpTillTheLastItemInDeliveryList() {
//  Inconsistnent
//        while(!DeliveryListElements.deliveriestableviewTableLastElement.isHittable) {
//            DeliveryListElements.app.swipeUp()
//        }
        
//  Alternative
        currCount = (DeliveryListElements.deliveriestableviewTableElements.count)
        while(!(DeliveryListElements.deliveriestableviewTableElements.count > currCount)) {
            DeliveryListElements.app.swipeUp()
        }
    }
    
    func whenILongPressOnADeliveryItem() {
        totalCount = DeliveryListElements.deliveriestableviewTableElements.count
        itemDesc = DeliveryListElements.deliveriestableviewTableElementDescription(itemNumber: 1).value as! String
        itemLoc = DeliveryListElements.deliveriestableviewTableElementLocation(itemNumber: 1).value as! String
        
        for i in 0...DeliveryListElements.deliveriestableviewTableElements.count-1 {
            if ((DeliveryListElements.deliveriestableviewTableElementDescription(itemNumber: i).value as! String == itemDesc) && (DeliveryListElements.deliveriestableviewTableElementLocation(itemNumber: i).value as! String == itemLoc)) {
                itemLikeCount = itemLikeCount + 1
            }
        }

        DeliveryListElements.deliveriestableviewTableElement(itemNumber: 1).press(forDuration: 2)
    }
    
    func whenITapOnADeliveryItem() {
        itemDesc = (DeliveryListElements.deliveriestableviewTableElementDescription(itemNumber: 1).value as! String)
        itemLoc = (DeliveryListElements.deliveriestableviewTableElementLocation(itemNumber: 1).value as! String)
        DeliveryListElements.deliveriestableviewTableElement(itemNumber: 1).tap()
    }
    
    func whenITapOn14thDeliveryItem() {
        itemDesc = (DeliveryListElements.deliveriestableviewTableElementDescription(itemNumber: 13).value as! String)
        itemLoc = (DeliveryListElements.deliveriestableviewTableElementLocation(itemNumber: 13).value as! String)
        DeliveryListElements.deliveriestableviewTableElement(itemNumber: 13).tap()
    }
    
    func thenIShouldSeeTheDeliveryList() {
        XCTAssertTrue(DeliveryListElements.deliveryList.waitForExistence(timeout: defaultTimeout))
        XCTAssertTrue(DeliveryListElements.deliveriestableviewTable.waitForExistence(timeout: defaultTimeout))
        XCTAssertTrue(DeliveryListElements.deliveriestableviewTableFirstElement.waitForExistence(timeout: defaultTimeout))
    }
    
    func thenIShouldSee20ItemsInTheDeliveryList() {
        XCTAssertTrue(DeliveryListElements.deliveriestableviewTableElements.count == 20)
    }

    func thenIShouldSee20ItemsAddedInTheDeliveryList() {
        var result = false
        for _ in 1...10 {
            sleep(1)
            if (DeliveryListElements.deliveriestableviewTableElements.count == (currCount+20)) {
                result = true
                break
            }
        }
        XCTAssertTrue(result)
    }
    
    func thenIShouldSeeForDeliveryListItemTheComponents(items:Int, components:[String]) {
        for i in 0...items-1 {
            components.forEach {
                switch $0 {
                case "icon":
                    XCTAssertTrue(DeliveryListElements.deliveriestableviewTableElementIcon(itemNumber: i).waitForExistence(timeout: defaultTimeout))
                case "description":
                    XCTAssertTrue(DeliveryListElements.deliveriestableviewTableElementDescription(itemNumber: i).waitForExistence(timeout: defaultTimeout))
                case "location":
                    XCTAssertTrue(DeliveryListElements.deliveriestableviewTableElementLocation(itemNumber: i).waitForExistence(timeout: defaultTimeout))
                default:
                    print("Please enter valid component name!")
                }
            }
        }
    }
    
    func thenIShouldSeeDescriptionOfEveryDeliveryListItemTheItemTypeAndItemTo(itemType:String, itemTo:String) {
        
        var itemText:String
        for i in 0...DeliveryListElements.deliveriestableviewTableElements.count-1 {
            itemText = ""
            switch itemType {
            case "documents":
                itemText = DeliveryListElements.deliveriestableviewTableElementDescription(itemNumber: i).value as! String
                if (itemText.contains(itemType)) {
                    XCTAssert(itemText.contains(itemTo))
                    print(itemText)
                }
            case "parcel":
                itemText = DeliveryListElements.deliveriestableviewTableElementDescription(itemNumber: i).value as! String
                if (itemText.contains(itemType)) {
                    XCTAssert(itemText.contains(itemTo))
                    print(itemText)
                }
            default:
                print("Please enter valid component type and to!")
            }
        }
    }
    
    func thenThatItemGetsDeletedFromTheDeliveryList() {
        XCTAssert(DeliveryListElements.deliveriestableviewTableElements.count == totalCount - 1)
/*
        var updatedDeleteItemLikeCount = 0
        for i in 0...DeliveryListElements.deliveriestableviewTableElements.count-1 {
            if ((DeliveryListElements.deliveriestableviewTableElementDescription(itemNumber: i).value as! String == itemDesc) && (DeliveryListElements.deliveriestableviewTableElementLocation(itemNumber: i).value as! String == itemLoc)) {
                updatedDeleteItemLikeCount = updatedDeleteItemLikeCount + 1
            }
        }
        
        XCTAssert(updatedDeleteItemLikeCount == (itemLikeCount - 1))
 */
    }

}


