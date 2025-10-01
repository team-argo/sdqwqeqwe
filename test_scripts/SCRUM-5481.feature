# language: en
@web @research-initiatives
Feature: Research Initiatives Page

  As a visitor to the site (e.g., a student, researcher, or potential partner)
  I want to view a page dedicated to our research initiatives
  so that I can understand the scope of the organization's work and find specific projects.

  Background:
    Given I am a visitor on the homepage

  @happy-path @smoke-test
  Scenario: Successfully navigate to the Research Initiatives page and view content
    When I navigate to the "Research" section via the main menu
    Then I should be on the "Our Research Initiatives" page
    And I should see the page heading "Our Research Initiatives"
    And I should see a list of at least one research initiative

  @ui @content
  Scenario: Verify the details displayed for each initiative in the list
    Given I am on the "Our Research Initiatives" page
    When I view the list of initiatives
    Then each initiative card should display a title
    And each initiative card should display a brief summary
    And each initiative card should display a "Learn More" link or button

  @functional @filtering
  Scenario Outline: Filtering initiatives by category
    Given I am on the "Our Research Initiatives" page
    And a filter control for "Category" is visible
    When I filter the initiatives by the category "<Category>"
    Then I should only see initiatives belonging to the "<Category>"
    And I should not see initiatives belonging to "<Other Category>"

    Examples:
      | Category                | Other Category        |
      | "Environmental Science" | "AI Ethics"           |
      | "AI Ethics"             | "Quantum Computing"   |
      | "Quantum Computing"     | "Environmental Science" |

  @edge-case
  Scenario: Display a message when no initiatives match the filter
    Given I am on the "Our Research Initiatives" page
    When I apply a filter that returns no results, like "Astrology"
    Then I should see a message indicating "No research initiatives found matching your criteria."
    And I should not see any initiative cards

  @navigation
  Scenario: Navigate to the detail page for a specific initiative
    Given I am on the "Our Research Initiatives" page
    And I see an initiative titled "Project Deep Dive into AI Ethics"
    When I click the "Learn More" link for "Project Deep Dive into AI Ethics"
    Then I should be taken to the detail page for that initiative
    And the page title should contain "Project Deep Dive into AI Ethics"