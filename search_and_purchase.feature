Feature: Search and purchase a product in the online store

  Scenario: Successful search and purchase of a product
    Given I am a registered user
    And I am logged into my account
    When I navigate to the homepage
    And I enter "laptop" into the search bar
    And I click the search button
    Then I should see a list of search results for "laptop"
    When I select the first product from the search results
    And I add the product to my cart
    And I proceed to the checkout
    And I enter my shipping information
    And I choose a payment method
    And I enter my payment details
    And I confirm the purchase
    Then I should see a confirmation message "Thank you for your purchase"
    And I should receive a confirmation email
    And my order should appear in my order history

  Scenario: Unsuccessful search due to no results
    Given I am a registered user
    And I am logged into my account
    When I navigate to the homepage
    And I enter "xyz123nonexistentproduct" into the search bar
    And I click the search button
    Then I should see a message "No results found for 'xyz123nonexistentproduct'"

  Scenario: Attempt to purchase without logging in
    Given I am on the homepage
    When I enter "smartphone" into the search bar
    And I click the search button
    Then I should see a list of search results for "smartphone"
    When I select the first product from the search results
    And I add the product to my cart
    And I proceed to the checkout
    Then I should be prompted to log in or create an account

  Scenario: Validation of purchase in order history
    Given I am a registered user
    And I am logged into my account
    And I have recently made a purchase
    When I navigate to my account
    And I view my order history
    Then I should see my recent order listed with the correct product and purchase details
