*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.iltalehti.fi
${BROWSER}    chrome

*** Test Cases ***
Open Google and Maximize Window
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

*** Keywords ***
# Open browser edge 
Maximize Browser Window
    Wait Until Page Contains    Uutiset    20s
    Wait Until Element Is Visible    //a[contains(text(), 'Uutiset')]  20s  
    Wait Until Element Is Enabled    //a[contains(text(), 'Uutiset')]   
    #Scroll Element Into View    
    Click Element    //a[contains(text(), 'Uutiset')]  
    Sleep    30s
 

