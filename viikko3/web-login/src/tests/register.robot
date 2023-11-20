*** Settings ***
Resource  resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Browser
Test Setup  Go To Register Page

*** Test Cases ***
Register With Valid Username And Password
    Set Username  valid
    Set Password  valid123
    Set Password2  valid123
    Submit Credentials
    Register Should Succeed

Register With Too Short Username And Valid Password
    Set Username  ka
    Set Password  valid123
    Set Password2  valid123
    Submit Credentials
    Register Should Fail With Message  Username must be at least 3 characters long

Register With Valid Username And Invalid Password
    Set Username  kalle
    Set Password  invalidd
    Set Password2  invalidd
    Submit Credentials
    Register Should Fail With Message  Password cannot contain letters only

Register With Nonmatching Password And Password Confirmation
    Set Username  kalle
    Set Password  invalid1
    Set Password2  invalid2
    Submit Credentials
    Register Should Fail With Message  Passwords do not match

*** Keywords ***
Set Username
    [Arguments]  ${username}
    Input Text  username  ${username}

Set Password
    [Arguments]  ${password}
    Input Password  password  ${password}

Set Password2
    [Arguments]  ${password}
    Input Password  password_confirmation  ${password}

Submit Credentials
    Click Button  Register

Register Should Succeed
    Welcome Page Should Be Open

Register Should Fail With Message
    [Arguments]  ${message}
    Register Page Should Be Open
    Page Should Contain  ${message}