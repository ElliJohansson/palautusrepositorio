*** Settings ***
Resource  resource.robot
Test Setup  Create User And Input New Command

*** Test Cases ***
Register With Valid Username And Password
    Input Credentials  valid  valid123
    Output Should Contain  New user registered

Register With Already Taken Username And Valid Password
    Input Credentials  kalle  kalle1234
    Output Should Contain  User with username kalle already exists

Register With Too Short Username And Valid Password
    Input Credentials  ka  kalle1234
    Output Should Contain  Username must be at least 3 characters long

Register With Long Enough But Invalid Username And Valid Password
    Input Credentials  kalle§  kalle1234
    Output Should Contain  Username contains invalid characters

Register With Valid Username And Too Short Password
    Input Credentials  valid  short
    Output Should Contain  Password must be at least 8 characters long

Register With Valid Username And Long Enough Password Containing Only Letters
    Input Credentials  valid  onlyletters
    Output Should Contain  Password cannot contain letters only

*** Keywords ***
Create User And Input New Command
    Create User  kalle  salasana123
    Input New Command

