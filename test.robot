*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.google.fi
${Browser}    chrome

*** Test Cases ***
In this we open browser and new window. 
    Open Browser   ${URL}    ${Browser}    options=add_argument("--incognito")
    Maximize Browser Window

*** Keywords ***
jotain tässä tehdää. 
    
    Scroll Element Into View    //button[contains(text(),'Hyväksy evästeet')]
    Wait Until Element Is Visible   //button[contains(text(),'Hyväksy evästeet')]    timeout=20s
    Click Element    //button[contains(text(),'Hyväksy evästeet')]
    Wait Until Page Contains    name=q    20s
    Wait Until Element Is Visible   name=q    20s
    Log    search box is visible
    Input Text    name=q    kokeilu 
    Log    input text '
    Capture Element Screenshot    name=q
    Sleep    40s


   # Wait Until Page Contains    videos    20s
   # Wait Until Element Is Visible    //a[@class='videos'] 20s
   
   # Scroll Element Into View    //a[@class='videos']
   # Click Element    //a[@class='videos']
    #Wait Until Element Is visible    //a[normalize-space()='Tilaa']
   # Click Element    //a[normalize-space()='Tilaa']
   # Capture Element Screenshot   //a[@class='videos']    ${CURDIR}/xxx.png 
   # Sleep    30s
