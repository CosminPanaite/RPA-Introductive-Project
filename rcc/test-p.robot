*** Settings ***
Documentation     Executes Google image search and stores the first result image. Based on Robocorp example-google-image-search-main

Library  Browser    strict=False
Library  Dialogs

Variables  devdata/env.py


*** Variables ***
${ANOTHER_SEARCH_TERM}    dog


#*** Test Cases ***
*** Tasks ***
Test Image Search With Playwright
    # 1.
    New Browser    headless=False
    ${browser_vp} =    Create Dictionary    width=1920    height=969
    New Context    viewport=${browser_vp}
    New Page    ${GOOGLE_URL}

    # 2. Hide cookie consent
    Run Keyword And Ignore Error    Click    button >> text=I agree

    # 3.
    Search for    ${SEARCH_TERM}

    # 4. View image search results
    Click    text=Images >> xpath=..

    # 5. Screenshot first result
    Wait For Elements State    div[data-ri="0"]
    Take Screenshot    selector=div[data-ri="0"]

    # 6.
    Go To    ${GOOGLE_URL}
    Search for    ${ANOTHER_SEARCH_TERM}

    # 7. View image search results
    Click    text=Images >> xpath=..

    # 8. Screenshot first result
    Wait For Elements State    div[data-ri="0"]
    Take Screenshot    selector=div[data-ri="0"]

    # 9.
    Close Browser


*** Keywords ***
Search for
    [Arguments]    ${text}
    Fill Text    input[name=q]    ${text}
    Keyboard Key    press    Enter
    Wait For Elements State    id=result-stats
