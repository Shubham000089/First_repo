*** Settings ***
Library     SeleniumLibrary
Library     DateTime
Variables    Locators.py
Library     BuiltIn
Library     String


*** Keywords ***
Enter field
    [Arguments]    ${INPUT_FIELD_LOCATOR}   ${INPUT_FIELD}
    press keys  ${INPUT_FIELD_LOCATOR}   CTRL+a+BACKSPACE
    input text    ${INPUT_FIELD_LOCATOR}    ${INPUT_FIELD}
    sleep    3  s

Click CTA Button
    [Arguments]    ${CONTINUE_BUTTON}
    click button    ${CONTINUE_BUTTON}
    sleep    5  s

Click Element Field
    [Arguments]    ${ELEMENT_FIELD}
    click element    ${ELEMENT_FIELD}
    sleep   5   s

Dropdown Field
    [Arguments]     ${DROPDOWN_FIELD}   ${OPEN_DROPDOWN}   ${INPUT_FIELD}
    click element   ${DROPDOWN_FIELD}
    sleep    3  s
    press keys      ${DROPDOWN_FIELD}   ${INPUT_FIELD}
    sleep   2   s
    run keyword and ignore error     click element   ${OPEN_DROPDOWN}
    #click element   ${OPEN_DROPDOWN}
    sleep    3  s

Select Dropdown By Key
        [Arguments]     ${DROPDOWN_FIELD}   ${OPEN_DROPDOWN}
        click element    ${DROPDOWN_FIELD}
        sleep   3   s
        press keys    ${OPEN_DROPDOWN}  ENTER
        sleep   3   s

Check Box Selected
        [Arguments]     ${Check_Box_ID}    ${Check_Box}
        ${Is_Check1}=   run keyword and return status   checkbox should be selected   ${Check_Box_ID}
        run keyword if  ${IS_Check1} == True    click element   ${Check_Box}
        sleep   1   s
        ${Is_Check1}=   run keyword and return status   checkbox should be selected   ${Check_Box_ID}
        run keyword if  ${IS_Check1} == False   click element   ${Check_Box}
        sleep   1   s

Navigation to module
        [Arguments]     ${SELECT_MODULE}
        log to console  ${SELECT_MODULE}
        ${xpath}=    Set Variable   ${NAVIGATION_MODULE}
        ${ALL_MODULE}=    get element count    ${xpath}
        ${MODULE_NAME}=    Create List
        FOR    ${i}    IN RANGE    1    ${ALL_MODULE} + 1
            ${MODULE}=    Get Text    xpath=(${xpath})[${i}]
            Append To List    ${MODULE_NAME}    ${MODULE}
        END
        FOR  ${item}  IN  @{MODULE_NAME}
            Run Keyword If	"${item}" == "${SELECT_MODULE}"	Click Element    //li[normalize-space(text())="${item}"]
        END
        sleep   5   s

Search Active Customer
    Navigation to module    ${Partner_Menu}
    wait until element is visible   ${CUSTOMER_DASHBOARD}
    click element   ${ACTIVE_STATUS}
    wait until element is enabled   ${ACTIVE_CHECKBOX}
    wait until element is visible    ${TABLE_ROW}
    click element   ${TABLE_ROW}
    wait until page contains element    ${BRAND_NAME}
    page should not contain     ${BACK_TO_CUSTOMER}
    page should not contain element     ${NAVIGATION_MODULE}

Count Marketplace
        [Arguments]     ${MARKETPLACES}
        @{Marketplaces_List}=   get webelements     ${MARKETPLACES}
        ${index}=    set variable   0
        FOR     ${element}  IN  @{Marketplaces_List}
            ${index}=   evaluate    ${index} + 1
            log to console  ${index}
        END
        [Return]    ${index}

Select Additional Marketplace
        [Arguments]     ${index}    ${DROPDOWN_FIELD}   ${OPEN_DROPDOWN}
        ${Length1}=     EVALUATE    15 - ${index}
        FOR   ${INDEX}  IN RANGE    ${Length1}
            sleep   1   s
            select dropdown by key  ${DROPDOWN_FIELD}   ${OPEN_DROPDOWN}
        END

Deselect Additional Marketplace
        [Arguments]     ${REMOVE_MARKETPLACE}
        FOR  ${INDEX}   IN RANGE    5
            sleep  1  s
            click element   ${REMOVE_MARKETPLACE}
        END

Multiselect Dropdown
        [Arguments]     ${DROPDOWN_FIELD}   ${OPEN_DROPDOWN}    ${MARKETPLACES}     ${REMOVE_MARKETPLACE}
        select dropdown by key      ${DROPDOWN_FIELD}   ${OPEN_DROPDOWN}
        ${INDEX}=   Count Marketplace   ${MARKETPLACES}
        log to console      ganpati bappa
        log to console  ${INDEX}
        run keyword if  ${INDEX} < 15   Select Additional Marketplace   ${INDEX}   ${DROPDOWN_FIELD}   ${OPEN_DROPDOWN}
        ${INDEX}=   Count Marketplace   ${MARKETPLACES}
        log to console  ${INDEX}
        run keyword if  ${INDEX} > 10  Deselect Additional Marketplace      ${REMOVE_MARKETPLACE}

Customer To Agreement
        Navigation to module    ${Partner_Menu}
        wait until element is visible   ${CUSTOMER_DASHBOARD}
        click element   ${PENDING_CHECKBOX}
        #wait until element is visible   ${TABLE_ROW}
        click element   ${RECURRING_CHECK}
        sleep   3   s
        press keys    ${PENDING_CONTRACT_CHECKBOX}    ALT+ARROW_DOWN
        wait Until Element is visible   ${PENDING_CONTRACT_CHECKBOX}
        click element    ${PENDING_CONTRACT_CHECKBOX}
        sleep   5   s
        #${Recurring_Text}=      get text    ${RECURRING_SERVICE}
        #log to console  ${Recurring_Text}
        #click element    ${RECURRING_SERVICE}
        #sleep    5  s
        click element   ${FIRST_TABLE_DATA}
        wait until element is visible    ${BRAND_NAME}
        sleep    5  s