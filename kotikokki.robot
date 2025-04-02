*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}           https://www.kotikokki.net
${SEARCH_TERM}   makaroonilaatikko
${EXPLORE_TEXT}  Explore the best of Pinterest
${BROWSER}       Chrome
${SEARCH_BOX}    xpath=//input[@type='search']
${SEARCH_BUTTON} xpath=//button[@type='submit']
${PASTA_FILTER}  xpath=//input[@type='radio' and @value='Pastat ja nuudelit']
${MEAT_FILTER}   xpath=//input[@type='checkbox' and @value='Makkara ja jauheliha']
${RECIPE_LIST}   xpath=//div[contains(@class, 'search-results')]//article
${FIRST_RECIPE}  xpath=(//div[contains(@class, 'search-results')]//article//a)[1]
${INGREDIENTS}   xpath=//ul[contains(@class, 'ingredients')]//li
${PINTEREST_LINK} xpath=//a[contains(@href, 'pinterest')]
${EXPLORE_LINK}  xpath=//a[contains(text(), 'Explore')]

*** Keywords ***
Avaa Kotikokki Ja Hae Resepti
    Open Browser    ${URL}    ${BROWSER}
    Wait Until Element Is Visible    ${SEARCH_BOX}    timeout=10s
    Input Text    ${SEARCH_BOX}    ${SEARCH_TERM}
    Click Button    ${SEARCH_BUTTON}
    Wait Until Element Is Visible    ${RECIPE_LIST}    timeout=10s
    Click Element    ${PASTA_FILTER}
    Click Element    ${MEAT_FILTER}
    Wait Until Element Is Visible    ${RECIPE_LIST}    timeout=5s

Varmista Hakutulokset Ja Valitse Resepti
    ${results_count}=    Get Element Count    ${RECIPE_LIST}
    Should Be True    ${results_count} > 0
    ${recipe}=    Get Text    xpath=(//div[contains(@class, 'search-results')]//article//h3)[1]
    Log    ${recipe}
    Click Element    ${FIRST_RECIPE}
    Wait Until Element Is Visible    ${INGREDIENTS}    timeout=5s

Tulosta Ainekset Konsoliin
    ${ingredients}=    Get WebElements    ${INGREDIENTS}
    FOR    ${ingredient}    IN    @{ingredients}
        ${text}=    Get Text    ${ingredient}
        Log To Console    ${text}
    END

Siirry Pinterestiin Ja Varmista Explore
    Wait Until Element Is Visible    ${PINTEREST_LINK}    timeout=5s
    Click Element    ${PINTEREST_LINK}
    Wait Until Element Is Visible    ${EXPLORE_LINK}    timeout=10s
    Click Element    ${EXPLORE_LINK}
    Wait Until Page Contains    ${EXPLORE_TEXT}    timeout=5s
    Close Browser

*** Test Cases ***
Testaa Kotikokki Hakutoiminto Ja Pinterest Linkki
    Avaa Kotikokki Ja Hae Resepti
    Varmista Hakutulokset Ja Valitse Resepti
    Tulosta Ainekset Konsoliin
    Siirry Pinterestiin Ja Varmista Explore
