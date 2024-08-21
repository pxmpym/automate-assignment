*** Settings ***
Library    SeleniumLibrary
Library    JSONLibrary
Resource    variables.resource

*** Keywords ***

Load Search Keywords
    ${data}=    Load Json From File    ${JSON_FILE}
    [Return]    ${data["keywords"]}

Search And Play All Songs
    ${keywords}=    Load Search Keywords
    FOR    ${keyword}    IN    @{keywords}
        # Log To Console    Searching for ${keyword}
        Search A Song    ${keyword}   
        Play A Song   
    END

Open Youtube
    Open Browser    ${YOUTUBE}    ${BROWSER}
    Maximize Browser Window        

Search A Song
    [Arguments]    ${keywords}
    Input Text    xpath://input[@id='search']   ${keywords}
    Click Element    xpath://button[@id='search-icon-legacy']
    Wait Until Element Is Visible    xpath://a[@id="video-title"]  
 
Play A Song  
    ${search_title}=    Get Text    xpath://a[@id="video-title"] 
    Click Element    xpath://a[@id="video-title"]
    Wait Until Element Is Visible    xpath://*[@id="title"]/h1  
    # Log To Console    r1= ${search_title}  
    ${video_title}=    Get Text    xpath://*[@id="title"]/h1  
    # Log To Console    r2= ${video_title}  
    Should Be Equal    ${search_title}    ${video_title}                  
    Sleep    20s

