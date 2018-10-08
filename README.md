# llmv

Instructions:

1. Open terminal on mac

2. Clone the reporsitory
$ git clone https://github.com/mad12blue/llmv.git

3. Move into the above cloned directory
$ cd llmv

4. Install all dependencies 
$ pod install 

5. Install XCTestHTMLReport dependency for custom reporting
$ bash <(curl -s https://raw.githubusercontent.com/TitouanVanBelle/XCTestHTMLReport/master/install.sh)

6(a). To run the tests in headless mode
$ TestNow=`date +%d-%m-%Y_%H.%M.%S` && xcodebuild -workspace LalaTest.xcworkspace -scheme "LalaTest" -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone X,OS=12.0' test -resultBundlePath Reports/TestResults-$TestNow | xcpretty -test -colors && xchtmlreport -r Reports/TestResults-$TestNow

6(b). To run the tests in gui mode on simulator
TestNow=`date +%d-%m-%Y_%H.%M.%S` && open -a Simulator.app && xcodebuild -workspace LalaTest.xcworkspace -scheme "LalaTest" -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone X,OS=12.0' test -resultBundlePath Reports/TestResults-$TestNow | xcpretty -test -color && killall "Simulator" && xchtmlreport -r Reports/TestResults-$TestNow

7. Once the tests have started, progress and brief summary of execution can be seen on the terminal in human readable format as shown below

Test Suite LalaTestProtocolBDDTests.xctest started
_1_LalaTestLaunchTest
✓ test_1_LalaTestAppIsRunning (11.221 seconds)
_2_LalaTestDeliveryDetailTest
✓ test_1_NavigateToDeliveryDetails (13.465 seconds)
✓ test_2_NavigateBackToDeliveryListFromDeliveryDetails (15.563 seconds)
✓ test_3_MapInDetailView (13.738 seconds)
✓ test_4_NavigateToDeliveryDetailsOf14thItem (9.400 seconds)
_3_LalaTestDeliveryListTest
✓ test_1_ItemsOnDeliveryListOnLoad (10.216 seconds)
✓ test_2_IconDescriptionLocationOfDeliveryItems (20.109 seconds)
✓ test_3_DescriptionTypeAndToOfDeliveryItems (12.075 seconds)
✓ test_4_ItemsOnDeliveryListOnScroll (17.117 seconds)

8. Once the test execution is complete, HTML report gets generated in "llmv/Reports/TestResults-<timeStamp>" folder

9. Navigate to "llmv/Reports/TestResults-<timeStamp>" folder and open "index.html" file in your favourite browser to view the latest test execution report in detail

10. Drilldown into each test case to get step by step execution report for every test case in the suite

11. Screenshots are attached for the failed test cases
