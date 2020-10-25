
Feature: Calculating Credit Card APR

Scenario: As a user, when I apply credit card, then I should get APR based on my credit score.

Given the following user information applied for credit card
|name          |ssn         |dob        |
|Arifin Firdaus|123-12-1234 | 02/02/2000|

When I press the apply button

Then I should see my APR rates
|ssn            |APR    |
|123-12-1234    |0.06%  |

