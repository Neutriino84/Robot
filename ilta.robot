*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.iltasanomat.fi
${Browser}    chrome

*** Test Cases ***
Open Broser and Window
    Open Browser    ${URL}    ${Browser}   
    Maximize Browser Window
*** Keywords ***
 Now open browser and website
    Wait Until Page Contains    Urheilu    Viihde 20s
    Wait Until Element Is Visible    //a[@class='nav-bar__link nav-bar__link-text'][normalize-space()='Urheilu']    
    # Wait Until Element Is Enable    
    Click Element    //a[@class='nav-bar__link nav-bar__link-text'][normalize-space()='Urheilu']  

    Sleep    31s

