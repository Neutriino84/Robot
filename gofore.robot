*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.kotikokki.net 

${Browser}    chrome



*** Test Cases ***
Testien teko
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
    Hakukentän tiedon haku


*** Keywords ***
Hakukentän tiedon haku
    Wait Until Page Contains    name=q  20s
    Wait Until Element Is Visible    //input[@id='recipe-search-free-text']    20s
    Input Text    //input[@id='recipe-search-free-text']    Makaronilaatikko 
    Wait Until Page Contains    haku
    Wait Until Element Is Visible    //button[@id='recipe-search-free-text-submit']    20s
    Click button  //button[@id='recipe-search-free-text-submit'] 
    Sleep    30s




   