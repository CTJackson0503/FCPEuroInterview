Feature: Sample Feature

Scenario: Add a product for a specific vehicle to my cart, and begin the checkout process.
   Given I visit "/"
   And dismiss the automated pop-up
   When I enter vehicle search parameters
   And I add an item to my cart
   Then I should see the item in my cart
   Then begin the checkout process
   And proceed as a guest
   Then I input necessary checkout information
   And I should see the payment information screen
   