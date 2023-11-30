*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Facebook Register
    Open Browser    http://www.facebook.com/r.php
    Maximize Browser Window

    # Handling cookies popup
    Wait Until Element Is Visible    xpath://button[@title='Allow all cookies']
    Click Element    xpath://button[@title='Allow all cookies']

    # Verify that we are on the registration page
    Wait Until Page Contains    Create a new account

    # Fill in registration form
    Input Text    name:firstname    Donald
    Input Text    name:lastname    Duck

    # Adding wait for visibility before interacting with dropdowns
    Wait Until Element Is Visible    id:month
    Click Element    id:month
    Select From List By Label    id:month    Apr

    Wait Until Element Is Visible    id:day
    Click Element    id:day
    Select From List By Label    id:day    30

    Select Radio Button    sex    2
