//
//  DeliveryListSteps.swift
//  LalaTestProtocolBDDTests
//
//  Created by Madhan on 05/10/18.
//  Copyright © 2018 Kenneth. All rights reserved.
//

import Foundation
import XCTest

//RE-USABLE VARIABLE (DEFAULT TIMEOUT)

var defaultTimeout:TimeInterval = 10

//STEP DEFINITION IMPLEMENTATION FOR LAUNCH SCREEN

extension Feature {
    
    //GIVE THE USER LAUNCHES THE APP
    func givenILaunchTheApp() {
        DeliveryListElements.app.launch()
    }
    
    //GIVEN THE APP IS ALREADY LAUNCHED
    func givenTheAppIsLaunched() {
        if(DeliveryListElements.app.state.rawValue != 4) {
            DeliveryListElements.app.launch()
        }
    }
    
    //THEN THE APP GETS CLOSED
    func thenICloseTheApp() {
        //while(DeliveryListElements.app.exists || (DeliveryDetailElements.app.state.rawValue == 0) || (DeliveryDetailElements.app.state.rawValue == 4)) {
            DeliveryListElements.app.terminate()
            XCTAssert(DeliveryDetailElements.app.state.rawValue != 4)
        //}
    }
}


