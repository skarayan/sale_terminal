Feature: Sale Terminal Total
  In order to pay at the store
  As a customer
  I want to get the total that I owe

  Scenario: Get the correct total
    Given that the prices of products are set by the store
    When I scan the products with product codes "ABCDABAA"
    Then I should get a total of "32.40"
    When I scan the products with product codes "CCCCCCC"
    Then I should get a total of "7.25"
    When I scan the products with product codes "ABCD"
    Then I should get a total of "15.40"

