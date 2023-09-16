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



