*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}   https://www.youtube.com
${Browser}    edge

*** Test Cases ***
This is test.

     Open Browser    ${URL}    ${Browser}
     Maximize Browser Window
     Scroll Element into view   //*[@id="content"]/div[2]/div[6]/div[1]/ytd-button-renderer[2]/yt-button-shape/button/yt-touch-feedback-shape/div/div[2] 
     Click Button   //*[@id="content"]/div[2]/div[6]/div[1]/ytd-button-renderer[2]/yt-button-shape/button/yt-touch-feedback-shape/div/div[2]
     Wait Until Element Is Visible    //a[@class='tilaukset']    20s                               #//ytd-mini-guide-entry-renderer[@aria-label='Tilaukset']//a[@id='endpoint']
     Click Element  //a[@class='tilaukset']  
     Sleep    50s  
*** Keywords ***
#Keywords what helps to do something.

   #Scroll Element into view    //*[@id="content"]/div[2]/div[6]/div[1]/ytd-button-renderer[2]/yt-button-shape/button/yt-touch-feedback-shape/div/div[2]
   #Click Button    //*[@id="content"]/div[2]/div[6]/div[1]/ytd-button-renderer[2]/yt-button-shape/button/yt-touch-feedback-shape/div/div[2]
   #Wait Until Element Is Visible    //a[@class='tilaukset']    20s                               #//ytd-mini-guide-entry-renderer[@aria-label='Tilaukset']//a[@id='endpoint']
   #Click Element  //a[@class='tilaukset']  
   #Sleep    50s         
   


    