Feature: Sale Terminal Total
  In order to pay at the store
  As a customer
  I want to get the total that I owe

  Scenario Outline: Get the correct total
    Given that the prices of products are set by the store
    When I scan the products with product codes "<codes>"
    Then I should get a total of "<total>"

  Scenarios: Business Cases
    | codes    | total |
    | ABCDABAA | 32.40 |
    | CCCCCCC  | 7.25  |
    | ABCD     | 15.40 |
