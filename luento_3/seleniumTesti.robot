*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Facebook register
    Open Browser    http://www.facebook.com/r.php
    Sleep    1
    Maximize Browser Window

    Click Element    xpath://button[@title='Allow all cookies']

    Page Should Contain    Create a new account

    Click Element    name:firstname
    Input Text    name:firstname    Donald
    
    Sleep    1

    Click Element    name:lastname
    Input Text    name:lastname    Duck
    
    Sleep    1

    Click Element    id:month
    Select From List By Label    id:month    Apr

    Click Element    id:day
    Select From List By Label    id:day    30

    Select Radio Button    sex    2



