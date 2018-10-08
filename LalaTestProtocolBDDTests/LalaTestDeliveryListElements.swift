//
//
//  Created by XCFit Framework
//  Copyright © 2017 XCFit Framework. All rights reserved.
//
//

/*

 This is sample code created by XCFit Framework and can be edited/Removed as per your project need. You can also re-arrange Xcode Groups and directories as per your need.

This file stores all the XCUIElements for the screen or feature in the Swift enum

 */


import Foundation
import XCTest

enum DeliveryListElements {
    
    static let app = XCUIApplication();
    static var appLaunched = false
    static let greetButton = app.buttons["Greet"]
    static let welcomeText = app.staticTexts["Welcome to POP"]
    static let deliveryList = app.navigationBars["Delivery List"]
    static let deliveriestableviewTable = app.tables["DeliveriesTableView"]
    static let deliveriestableviewTableElements = deliveriestableviewTable.children(matching: .cell)
    static let deliveriestableviewTableFirstElement = deliveriestableviewTable.children(matching: .cell).element(boundBy: 1)
    
    static func deliveriestableviewTableElement(itemNumber: Int) -> XCUIElement {
        return deliveriestableviewTable.children(matching: .cell).element(boundBy: itemNumber)
    }
    static func deliveriestableviewTableElementIcon(itemNumber: Int) -> XCUIElement {
        return deliveriestableviewTable.children(matching: .cell).element(boundBy: itemNumber).images["DeliveryCellPhoto"]
    }
    static func deliveriestableviewTableElementDescription(itemNumber: Int) -> XCUIElement {
        return deliveriestableviewTable.children(matching: .cell).element(boundBy: itemNumber).staticTexts["DeliveryCellTitle"]
    }
    static func deliveriestableviewTableElementLocation(itemNumber: Int) -> XCUIElement {
        return deliveriestableviewTable.children(matching: .cell).element(boundBy: itemNumber).staticTexts["DeliveryCellSubtitle"]
    }

}

class Springboard
{
    static let springboard:XCUIApplication? = XCUIApplication(bundleIdentifier: "com.apple.springboard")
    static let settings:XCUIApplication? = XCUIApplication(bundleIdentifier: "com.apple.Preferences")
    
    class func deleteApp()
    {
        XCUIApplication().terminate()
        
        if let springboard = springboard
        {
            springboard.activate()
            
            /* Force delete the app from the springboard. */
            let icon = springboard.icons["LalaTest"]
            if icon.isHittable
            {
                let iconFrame = icon.frame
                let springboardFrame = springboard.frame
                icon.press(forDuration: 1.3)
                
                /* Tap the little "X" button at approximately where it is. The X is not exposed directly. */
                springboard.coordinate(withNormalizedOffset: CGVector(dx: (iconFrame.minX + 3) / springboardFrame.maxX, dy: (iconFrame.minY + 3) / springboardFrame.maxY)).tap()
                springboard.alerts.buttons["Delete"].tap()
                
                /* Press home once to make the icons stop wiggling. */
                XCUIDevice.shared.press(.home)
                /* Press home again to go to the first page of the springboard. */
                XCUIDevice.shared.press(.home)
                /* Wait some time for the animation to end. */
                Thread.sleep(forTimeInterval: 0.5)
                
                if let settings = settings
                {
                    let settingsIcon = springboard.icons["Settings"]
                    if settingsIcon.isHittable
                    {
                        settingsIcon.tap()
                        settings.tables.staticTexts["General"].tap()
                        settings.tables.staticTexts["Reset"].tap()
                        settings.tables.staticTexts["Reset Location & Privacy"].tap()
                        settings.buttons["Reset Warnings"].tap()
                        settings.terminate()
                    }
                    else
                    {
                        XCUIDevice.shared.press(.home)
                        let settingsIcon = springboard.icons["Settings"]
                        if settingsIcon.isHittable
                        {
                            settingsIcon.tap()
                            settings.tables.staticTexts["General"].tap()
                            settings.tables.staticTexts["Reset"].tap()
                            settings.tables.staticTexts["Reset Location & Privacy"].tap()
                            settings.buttons["Reset Warnings"].tap()
                            settings.terminate()
                        }
                    }
                }
                else
                {
                    print("iOS Settings app not found!")
                }
            }
            else
            {
                print("App icon not found!")
            }
        }
        else
        {
            print("Springboard not found!")
        }
    }
}

