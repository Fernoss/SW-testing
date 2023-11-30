*** Settings ***
Library    String
Library    Collections
Library    OperatingSystem

*** Test Cases ***
Lue tiedostosta pingattavat osoitteet
    ${fileContent}=    Get File    /Users/jfkoskinen/HAMK/TKM22/asiakprojektien_toteutt/Ohjelmistotest/SW-testing/exercise/webpages.txt
    ${addresses}=    Split To Lines    ${fileContent}
    Set Global Variable    ${addresses}

Selvitä silmukassa ip ja keskiarvo sekä luo vastaustiedosto
    Create File    /Users/jfkoskinen/HAMK/TKM22/asiakprojektien_toteutt/Ohjelmistotest/SW-testing/exercise/file.txt
    ${count}=    Get Length    ${addresses}
    FOR    ${index}    IN RANGE    ${count}
        ${output}=    Run And Return Rc And Output    ping ${addresses}[${index}] -c 4
        Log    ${output}

        # Etsi tarvittavat tiedot outputista
        @{wordList}=    Split String     ${output}[1]
        ${index}=    Get Index From List    ${wordList}    from
        ${IPAddress}=    Set Variable    ${wordList}[${index+1}]

        # Ping
        @{pingList}=    Split String     ${output}[1]
        ${index1}=    Get Index From List    ${pingList}    =
        ${ping}=    Set Variable    ${pingList}[${index1+1}]

        # Lisää tiedot vastaustiedostoon
        Append To File    /Users/jfkoskinen/HAMK/TKM22/asiakprojektien_toteutt/Ohjelmistotest/SW-testing/exercise/file.txt    IP address ${IPAddress} and Ping: ${ping} \n

        # Testaa, että aika on alle 50ms
        ${lessThan50ms}=    Evaluate    ${ping} < 50
        Should Be True    ${lessThan50ms}
    END
