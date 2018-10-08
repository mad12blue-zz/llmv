//
//  DeliveryListSteps.swift
//  LalaTestProtocolBDDTests
//
//  Created by Madhan on 05/10/18.
//  Copyright © 2018 Kenneth. All rights reserved.
//

import Foundation
import XCTest

var defaultTimeout:TimeInterval = 10

extension Feature {
    
    func givenILaunchTheApp() {
        DeliveryListElements.app.launch()
    }
    
    func givenTheAppIsLaunched() {
        if(DeliveryListElements.app.state.rawValue != 4) {
            DeliveryListElements.app.launch()
        }
    }
    
    func thenICloseTheApp() {
        //while(DeliveryListElements.app.exists || (DeliveryDetailElements.app.state.rawValue == 0) || (DeliveryDetailElements.app.state.rawValue == 4)) {
            DeliveryListElements.app.terminate()
        //}
    }
}


