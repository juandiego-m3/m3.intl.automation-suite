@login
Feature: Test that a user can login to DNUK

As a doctor
    I want to be able to login to the website

	Scenario: Not logged in user redirected to login page
		Given I open the url "https://home.doctors.net.uk"
		And I pause for 1000ms
		Then I expect the url to contain "https://www.doctors.net.uk/Login/Login.aspx"

	Scenario: User navigates to DNUK and can see login button
		Given I open the url "https://www.doctors.net.uk"
		And I pause for 1000ms
		Then I expect that element ".login" does exist
		And I expect that element ".login" is visible
	
	Scenario: Clicking login button navigates user to login page
		When I click on the button ".login"
		Then I expect the url to contain "https://www.doctors.net.uk/Login/Login.aspx"
		And I expect that element "#ctl00_cCphContent_cTxtUsername" not contains any text
		And I expect that element "#ctl00_cCphContent_cTxtPassword" not contains any text
		
	Scenario: Attempt to login with no credentials
        Given I click on the button "#ctl00_cCphContent_cBtnLogin"
        Then I expect that element "#dlgMessage" is visible
		And I expect that element "#dlgMessage" contains the text "Please enter a username."
		When I click on the button ".ui-button"
		Then I expect that element "#dlgMessage" is not visible

	Scenario: Attempt to login with invalid credentials
        When I set "test" to the inputfield "input[name='ctl00$cCphContent$cTxtUsername']"
        And I set "testpassword" to the inputfield "#ctl00_cCphContent_cTxtPassword"
        And I click on the button "[value='Login']"
        Then I expect that element "#dlgMessage" is visible
		And I expect that element "#dlgMessage" contains the text "Please check your details and try again"
		When I click on the button ".ui-button"
		Then I expect that element "#dlgMessage" is not visible

	Scenario: Attempt to login with valid credentials
        When I set "nagios.monitor" to the inputfield "input[name='ctl00$cCphContent$cTxtUsername']"
        And I set "10m43t" to the inputfield "#ctl00_cCphContent_cTxtPassword"
        And I click on the button "[value='Login']"
		And I pause for 2000ms
        Then I expect the url to contain "https://home.doctors.net.uk"
	