# Vin Checker

Vin Checker allow to validate if a VIN's "check code" is correct, decode the "make" and "model year" from it, and suggest valid VIN code.

## dev env setup

To setup the dev env, run `bundle install`

## specs

To test the code, execute: `bundle exec rspec`

## Demonstration

To check some demonstration output, run: `ruby demo.rb SOME-VIN-CODE-HERE`.

### Valid vin example

```bash
$ ruby demo.rb JN1DA31D63T505967

Check Digit: VALID
This looks like a VALID vin!
Decoded data:
        make: Nissan
        model_year: 2003
```

### Invalid vin example

```bash
$ ruby demo.rb 1XPTD40X0JD456115

Provided VIN: 1XPTD40X0JD456115
Check Digit: INVALID
Suggested VIN(s):

        * 1XPTD40X6JD456115
```
