*** Settings ***
Documentation   Robot test task

Library  RPA.Browser.Playwright    strict=False
Library  Dialogs


*** Variables ***
${MY_URL}  https://www.foreca.com/100681290/Cluj-Napoca-Romania


*** Tasks ***
My Custom Task
    [Documentation]  Test
    New Browser    headless=False
    ${browser_vp} =    Create Dictionary    width=1920    height=969
    New Context    viewport=${browser_vp}
    New Page    ${MY_URL}

    # 2. Hide cookie consent
    Run Keyword And Ignore Error    Click    button >> text=agree

    My Keyword

    Pause Execution    Click OK to continue


*** Keywords ***
My Keyword
    [Documentation]  Sample keyword
    Log    Do nothing
