# llmv

Step by step instructions to execute the test suite:

1. Open terminal on mac

2. Clone the repository
$ git clone https://github.com/mad12blue/llmv.git

3. Navigate into the above cloned directory
$ cd llmv

4. Install all dependencies 
$ pod install 

5. Install XCTestHTMLReport dependency for custom reporting
$ bash <(curl -s https://raw.githubusercontent.com/TitouanVanBelle/XCTestHTMLReport/master/install.sh)

6(a). To run the tests in headless mode
$ TestNow=`date +%d-%m-%Y_%H.%M.%S` && xcodebuild -workspace LalaTest.xcworkspace -scheme "LalaTest" -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone X,OS=12.0' test -resultBundlePath Reports/TestResults-$TestNow | xcpretty -test -colors && xchtmlreport -r Reports/TestResults-$TestNow

6(b). To run the tests in gui mode on simulator
$ TestNow=`date +%d-%m-%Y_%H.%M.%S` && open -a Simulator.app && xcodebuild -workspace LalaTest.xcworkspace -scheme "LalaTest" -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone X,OS=12.0' test -resultBundlePath Reports/TestResults-$TestNow | xcpretty -test -color && killall "Simulator" && xchtmlreport -r Reports/TestResults-$TestNow

7. Once the tests have started, progress and brief summary of execution can be seen on the terminal in human readable format as shown below

![Alt text](/ReadmeImages/TerminalSummary.png?raw=true "Optional Title")

8. Once the test execution is complete, HTML report gets generated in "llmv/Reports/TestResults-<timeStamp>" folder



9. Navigate to "llmv/Reports/TestResults-<timeStamp>" folder and open "index.html" file in your favourite browser to view the latest test execution report in detail

10. Drilldown into each test case to get step by step execution report for every test case in the suite



11. Screenshots are attached for the failed test cases


