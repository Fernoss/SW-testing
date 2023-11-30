*** Settings ***
Library    String
Library    Collections    
Library    OperatingSystem

*** Variables ***
${first_name}    Donald
${last_name}    Duck
@{numbers}    1    2    3    4
@{names}    Donald    Mickey    Goofy    Scrooge    Daisy

*** Test Cases ***
Check Outcome
    ${full_name}=    Set Variable    ${first_name} ${last_name}
    Should Be Equal    ${full_name}    Donald Duck

*** Test Cases ***
Check Value from List
    ${number}=    Set Variable    ${numbers}[2]
    Should Be Equal    ${number}    3

*** Test Cases ***
Add Value to the List
    @{numbers}    Copy List    ${numbers}
    ${addition}=    Set Variable    333
    Append To List    ${numbers}    ${addition}
    Should Be Equal    ${numbers}[4]    ${addition}

*** Test Cases ***
List Length
    ${length}=    Get Length    ${numbers}
    ${expected}=    Convert To Integer    4
    Should Be Equal    ${length}    ${expected}

*** Test Cases ***
Put List in Alphabetical Order
    Sort List    ${names}
    Log    Sorted Names: ${names}
    Should Be Equal    ${names}[0]    Daisy

*** Test Cases ***
Loop Through the List
    FOR    ${counter}    IN RANGE    1    10
        Log    Counter Value: ${counter}
    END

*** Test Cases ***
Loop Names List
    FOR    ${element}    IN    @{names}
        Log    Element Value: ${element}
    END

*** Test Cases ***
Make New Directory
    Create Directory    /Users/jfkoskinen/HAMK/TKM22/asiakprojektien_toteutt/Ohjelmistotest/SW-testing/robotFiles/test1
    Directory Should Exist    /Users/jfkoskinen/HAMK/TKM22/asiakprojektien_toteutt/Ohjelmistotest/SW-testing/robotFiles/test1

*** Test Cases ***
Ping Web Page
    ${output}=    Run And Return Rc And Output    ping www.google.com -c 4
    Log    Ping Output: ${output}

*** Test Cases ***
Read Text and Find Word Students
    ${path}=    Set Variable    /Users/jfkoskinen/HAMK/TKM22/asiakprojektien_toteutt/Ohjelmistotest/SW-testing/robotFiles/
    ${output}=    Get File    ${path}example.txt
    Log    File Content: ${output}
    ${output}=    Remove String    ${output}    .    ,
    @{wordList}=    Split String    ${output}
    Log    Word List: ${wordList}
    ${index}=    Get Index From List    ${wordList}    students
    Should Be Equal    ${index}    ${24}

*** Test Cases ***
Get IP Address
    ${output}=    Run And Return Rc And Output    ifconfig -L en0
    @{wordList}=    Split String     ${output}[1]
    Log    IP Address Word List: ${wordList}
    ${index}=    Get Index From List    ${wordList}    netmask
    ${index}=    Evaluate    ${index}-1
    ${IPAddress}=    Set Variable    ${wordList}[${index}]
    Log    IP Address: ${IPAddress}
