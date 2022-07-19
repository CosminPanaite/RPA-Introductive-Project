*** Settings ***
Documentation     Executes Google image search and stores the first result image. Based on Robocorp example-google-image-search-main

Library  RPA.Browser.Selenium
Library  Dialogs
Library  RPA.Excel.Files


*** Variables ***
${ANOTHER_SEARCH_TERM}    dog


*** Tasks ***
Image Search With Selenium
    # 1.
    Open Available Browser    %{GOOGLE_URL}    maximized=True
    #Open Browser    %{GOOGLE_URL}    browser=chrome

    # 2. Hide cookie consent
    Click Element If Visible    xpath://button/div[contains(text(), 'Accept all')]
    
    # 3.
    Search for    %{SEARCH_TERM}
    
    # 4. View image search results
    Click Link    Images
    
    # 5. Screenshot first result
    Capture Element Screenshot    css:div[data-ri="0"]
    
    # 6. Search dog
    Go To    %{GOOGLE_URL}
    Search for    ${ANOTHER_SEARCH_TERM}

    # 7. View image search results
    Click Link    Images

    # 8. Screenshot first result
    Capture Element Screenshot    css:div[data-ri="0"]

    # 9.
    Close Browser






Emag price
    # 1.
    Open Available Browser    %{EMAG_URL}    maximized=True
    # 2.
    Input Text    id=searchboxTrigger     %{SEARCH_EMAG}
    Press Keys    id=searchboxTrigger    ENTER
    Sleep    2s
    
    # 3. open product
    Click Element    xpath://*[@id='card_grid']/div/div/div/div[3]/a
    
    ${a}    Get Text    xpath://*{@class='product-new-price'}
    # 4. Create excel
    Excel keywords Demo
        Open Workbook    Data.xlsx
        Set Cell Value    1    1    ${a}
        Set Worksheet Value    1    B    25
        

    # 7.
    Close Browser

*** Keywords ***
Search for
    [Arguments]    ${text}
    Input Text    name:q    ${text}
    Press Keys    name:q    ENTER
    Wait Until Page Contains Element    search
Excel keywords Demo
    Open Workbook    Data.xlsx
    Set Cell Value    1    1    23
    Set Worksheet Value    1    B    25
    Save Workbook    Data.xlsx
    

