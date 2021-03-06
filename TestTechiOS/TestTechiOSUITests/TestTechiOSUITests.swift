//
//  TestTechiOSUITests.swift
//  TestTechiOSUITests
//
//  Created by DIAN on 11/11/2021.
//

import XCTest

class TestTechiOSUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAppUI() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let firstCell = app.tables.cells.element(boundBy: 0)
        
        firstCell.tap()
        sleep(1)
        XCUIApplication().navigationBars["TestTechiOS.DetailView"].buttons["Articles"].tap()
        sleep(1)
        
        let filtreButton = app.navigationBars["Articles"].buttons["Filtre"]
        
        filtreButton.tap()
        sleep(1)
        app/*@START_MENU_TOKEN@*/.pickerWheels["Véhicule"]/*[[".pickers.pickerWheels[\"Véhicule\"]",".pickerWheels[\"Véhicule\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        sleep(1)
        
        let toolbar = app.toolbars["Toolbar"]
        
        toolbar.buttons["Done"].tap()
        sleep(1)
        filtreButton.tap()
        sleep(1)
        toolbar.buttons["Reset"].tap()
        sleep(1)
        filtreButton.tap()
        sleep(1)
        toolbar.buttons["Cancel"].tap()
        sleep(1)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
