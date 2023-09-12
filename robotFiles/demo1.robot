*** Settings ***
Library    String
Library    Collections    
Library    OperatingSystem

*** Variables ***
${one}    Donald
${two}    Duck
@{list}    1    2    3    4
@{names}    Donald    Mickey    Goofy    Scrooge    Daisy   

*** Test Cases ***
Check outcome
    ${three}=    Set Variable    Donald Duck
    Should Be Equal    ${one} ${two}    ${three}

*** Test Cases ***
Check value from list
    ${number}=    Set Variable    ${list}[2]
    Should Be Equal    ${number}    3

*** Test Cases ***
Add value to the list
    @{list}    Copy List    ${list}
    ${addition}=    Set Variable    333
    Append To List    ${list}    ${addition}
    Should Be Equal    ${list}[4]    ${addition}

*** Test Cases ***
List length
    ${length}=    Get Length    ${list}
    ${expected}=    Convert To Integer    4
    Should Be Equal    ${length}    ${expected}

*** Test Cases ***
Put list in alphabetical order
    Sort List    ${names}
    Log    ${names}
    Should Be Equal    ${names}[0]    Daisy

*** Test Cases ***
Loop through the list
    FOR    ${counter}    IN RANGE    1    10
        Log    ${counter}
        
    END

*** Test Cases ***
Loop names list
    # Huomio FOR-loopissa viitataan @-merkillä listaa
    FOR    ${element}    IN    @{names}
        Log    ${element}
        ${new}=    Set Variable    ${element}
    END

*** Test Cases ***
Make new directory
    Create Directory    /Users/jfkoskinen/HAMK/TKM22/asiakprojektien_toteutt/Ohjelmistotest/SW-testing/robotFiles/test1
    Directory Should Exist    /Users/jfkoskinen/HAMK/TKM22/asiakprojektien_toteutt/Ohjelmistotest/SW-testing/robotFiles/test1

*** Test Cases ***
Ping web page
    ${output}=    Run And Return Rc And Output    ping www.google.com -c 4
    Log    ${output}

*** Test Cases ***
Read text and find word students
    ${path}=    Set Variable    /Users/jfkoskinen/HAMK/TKM22/asiakprojektien_toteutt/Ohjelmistotest/SW-testing/robotFiles/
    ${output}=    Get File    ${path}example.txt
    Log    ${output}
    ${output}=    Remove String    ${output}    .    ,
    @{wordList}=    Split String    ${output}
    Log    ${wordList}
    ${index}=    Get Index From List    ${wordList}    students
    Should Be Equal    ${index}    ${24}

*** Test Cases ***
Get IP address
    ${output}=    Run And Return Rc And Output    ifconfig -L en0
    @{wordList}=    Split String     ${output}[1]
    Log    ${wordList}
    ${index}=    Get Index From List    ${wordList}    netmask
    ${index}=    Evaluate    ${index}-1
    ${IPAddress}=    Set Variable    ${wordList}[${index}]
    Log    ${IPAddress}