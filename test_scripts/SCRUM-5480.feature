# language: en
@regression @homepage @provider-portal

Feature: Healthcare Provider Homepage

  As a logged-in healthcare provider,
  I want a central homepage that displays my daily schedule, critical alerts, and quick actions,
  So that I can efficiently manage my daily tasks and patient care.

  Background:
    Given I am an authenticated healthcare provider
    And I have successfully logged into the application
    When I navigate to the provider homepage

  Scenario: Verify the display of main homepage components
    Then I should see a header containing the application logo and my user name
    And I should see a main navigation menu with links to "Patients", "Appointments", and "Billing"
    And I should see a dashboard section titled "Today's Schedule"
    And I should see a dashboard section titled "Urgent Alerts"
    And I should see a section for "Quick Actions"

  Scenario: Provider views their appointment schedule for the day
    Given I have three appointments scheduled for today
    When I view the "Today's Schedule" section
    Then I should see a list of 3 appointments
    And each appointment in the list should display the patient's name, appointment time, and reason for visit

  Scenario: Provider views an empty appointment schedule
    Given I have no appointments scheduled for today
    When I view the "Today's Schedule" section
    Then I should see a message indicating "You have no appointments for today."

  Scenario: Provider views and interacts with urgent alerts
    Given I have new critical alerts for my patients, including "Abnormal Lab Results"
    When I view the "Urgent Alerts" section
    Then I should see a list of alerts, each with a priority level and a brief description
    When I click on the "Abnormal Lab Results" alert
    Then I should be redirected to the detailed view for that specific patient alert

  Scenario: Provider has no urgent alerts
    Given I have no new critical alerts for my patients
    When I view the "Urgent Alerts" section
    Then I should see a message indicating "No urgent alerts at this time."

  Scenario: Provider uses a Quick Action to find a patient
    Given the "Quick Actions" section is visible
    When I use the "Find a Patient" search bar in the "Quick Actions" section
    And I enter the name "Johnathan Doe"
    And I click the "Search" button
    Then I should be redirected to the patient search results page displaying information for "Johnathan Doe"

  Scenario: Provider uses a Quick Action to register a new patient
    Given the "Quick Actions" section is visible
    When I click the "Register New Patient" button
    Then I should be taken to the new patient registration form

  Scenario: Provider logs out from the homepage
    When I click on my user profile menu in the header
    And I select the "Logout" option
    Then I should be successfully logged out
    And I should be redirected to the application login page

  Scenario: Unauthenticated user access attempt
    # This scenario intentionally does not use the Background
    Given I am not an authenticated user
    When I attempt to access the provider homepage URL directly
    Then I should be redirected to the login page
    And I should see an error message stating "You must be logged in to access this page."