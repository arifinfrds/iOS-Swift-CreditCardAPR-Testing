Feature: Applying credit card while under 18 years old

Scenario: As a user who is less than 18 years old, when I apply a credit card, then it should be denied.

Given the following user information
|name           | ssn           | dob           |
|Arifin Firdaus | 234-56-3333   | 02/10/2019    |

When I press the apply button

Then I should get a rejection message
