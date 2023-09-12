# Joonas Koskinen
# Tehtävä 3: Robot Framework - Ping (yksilötehtävä)
# Kaikkeni yritin, en onnistunut 100%...!!!!
*** Settings ***
Library    String
Library    Collections    
Library    OperatingSystem

*** Test Cases ***
Lue tiedostosta pingattavat osoitteet
    # Lue tiedostosta muuttujaan
    ${fileContent}=    Get File    /Users/jfkoskinen/HAMK/TKM22/asiakprojektien_toteutt/Ohjelmistotest/SW-testing/exercise/webpages.txt
    # Tee tiedoston sisällöstä sanalista ${addresses}
    ${addresses}=    Split To Lines    ${fileContent}
    # Aseta haettu lista globaaliksi muuttujaksi
    Set Global Variable    ${addresses}

*** Test Cases ***
Selvitä silmukassa ip ja keskiarvo sekä luo vastaustiedosto
    # Luo tyjä tiedosto
    Create File    /Users/jfkoskinen/HAMK/TKM22/asiakprojektien_toteutt/Ohjelmistotest/SW-testing/exercise/file.txt
    # Selvitä kuinka monta osoitetta ${addresses} listassa on ja tallenna se muuttujaan ${count}
    ${count}=    Get Length    ${addresses}
    # testi
    Log    ${count}
    # Silmukka joka käy listan läpi ja suorittaa pingin
    FOR    ${index}    IN RANGE    ${count}
        # ping suoritus
        ${output}=    Run And Return Rc And Output    ping ${addresses}[${index}] -c 4
        Log    ${output}
        # Etsi tarvittavat tiedot outputista
        # IP Address
        @{wordList}=    Split String     ${output}[1]
        Log    ${wordList}
        ${index}=    Get Index From List    ${wordList}    from   
        ${IPAddress}=    Set Variable    ${wordList}[${index+1}]
        Log    ${IPAddress}

        #  # Kaikki neljä pingiä + yritys keskiarvoon..
        # @{pingList}=    Split String     ${output}[1]
        # FOR    ${ping_index}    IN RANGE    4
        #     ${index1}=    Get Index From List    ${pingList}    ttl=58   
        #     ${ping}=    Set Variable    ${pingList}[${index1+1}]
        #     Log    Ping ${ping_index + 1}: ${ping + 1}
        #     # EN SAA TOIMIMAAN... VASTAUS JOKA KERTA = time=37.600
        #     # Move to the next set of ping results
        #     Remove From List    ${pingList}    0
        # END

         # Ping
        @{pingList}=    Split String     ${output}[1]
        Log    ${wordList}
        ${index1}=    Get Index From List    ${pingList}    =  
        ${ping}=    Set Variable    ${pingList}[${index1+1}]
        Log   Ping: min/avg/max/stddev ${ping}

        # # Ping Average
        # @{pingAverage}=    Split String    ${ping}[1]
        # Log    ${pingAverage}
        # ${index2}=    Get Index From List    ${pingAverage}    =
        # ${pingTime}=    Set Variable    ${pingAverage}[${index2+1}]
        # Log    ${pingTime}
        
        # # Lisää tiedot vastaustiedostoon
        Append To File    /Users/jfkoskinen/HAMK/TKM22/asiakprojektien_toteutt/Ohjelmistotest/SW-testing/exercise/file.txt    IP address ${IPAddress} and Ping: ${ping} \n
        # # Testaa, että aika on alle 50ms
        # ${lessThan50ms}=    Evaluate    ${ping} < 50
        # Should Be True    ${lessThan50ms}
    END