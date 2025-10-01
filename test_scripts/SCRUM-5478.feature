# Language: en
@web @about-us
Feature: About Us Page

  In order to learn about the company's mission, values, and team
  As a site visitor
  I want to be able to access and view the "About Us" page content

  Background:
    Given I am a guest user on the homepage

  @smoke @navigation
  Scenario: Successfully navigate to the About Us page from the main header
    When I click on the "About Us" link in the main navigation
    Then I should be on the "About Us" page
    And the page title should be "About Us | Our Company Name"
    And I should see a heading with the text "About Our Company"

  @regression @navigation
  Scenario: Successfully navigate to the About Us page from the site footer
    When I click on the "About Us" link in the footer
    Then I should be on the "About Us" page
    And I should see a heading with the text "About Our Company"

  @regression @content
  Scenario: Verify the main content sections are present on the page
    Given I have navigated to the "About Us" page
    Then I should see a section with the title "Our Mission"
    And I should see a section with the title "Our Story"
    And I should see a section with the title "Meet the Team"

  @regression @content
  Scenario: Verify team member information is displayed correctly
    Given I have navigated to the "About Us" page
    When I view the "Meet the Team" section
    Then I should see at least 3 team member profiles
    And each team member profile should contain an image, a name, and a job title

  @regression @functionality
  Scenario Outline: Verify social media links navigate to the correct destination
    Given I have navigated to the "About Us" page
    When I click on the "<SocialMedia>" link in the team section
    Then a new browser tab should open with the URL "<ExpectedURL>"

    Examples:
      | SocialMedia | ExpectedURL                               |
      | LinkedIn    | https://www.linkedin.com/company/our-company |
      | Twitter     | https://twitter.com/our-company-handle       |
      | Glassdoor   | https://www.glassdoor.com/our-company        |

  @responsive @mobile
  Scenario: Ensure the About Us page layout is responsive on a mobile device
    Given I am viewing the site on a mobile viewport
    And I have navigated to the "About Us" page
    Then the main navigation should be collapsed into a hamburger menu
    And the page content should be displayed in a single, scrollable column
    And all team member images should be scaled correctly to fit the screen width