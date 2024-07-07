## Overview

A simple cashier implementation with the following features:

- Scan products into a basket
- Define discount rules using a dsl for easiness of use
- Calculate total price applying discounts as necessary
- In-memory product "database" reads products from json file

## Discount rule definition

The rule definition is implemented as a DSL using ruby language metaprogramming features.
See discount_rules.rb for details on how to define a rule.

## Running the tests

Run all the tests with the rake command.

```bash
rake
```
