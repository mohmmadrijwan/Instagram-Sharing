*** Settings ***
Library           ../lib/lib.py

*** Variables ***	

*** Test Cases ***
Instagram_Sharing
    [Tags]    Sharing
    [Setup]   
    Set Test Documentation    Robot starts
    WHILE    True    limit=NONE
        ${check}    ${data1}    ${data2}    detect_new_articles

        IF  ${check}
            ${paragraph}    fetch_article_content
            Log             ${paragraph}

            ${caption}      generate_caption    ${paragraph}
            Log             ${caption}

            getImage

            ${shortUrl}     shorten_url
            Log             ${shortUrl}

            saveToJsonFile

            uploadToInstaPage

            openInstapage
        END
    END
    Set Test Message    Robot ends successfully
    

*** Keywords ***

