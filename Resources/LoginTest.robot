*** Settings ***
Library     SeleniumLibrary
Variables   Locators.py

*** Variables ***
${LOGIN URL}    https://staging.next.buyboxexperts.com      #https://onboarding-stage.next.buyboxexperts.com/signin
${BROWSER}      Chrome
${INCORRECT_EMAIL}      rsonawne+test001@buyboxexperts.com
${INVALID_USERNAME}     rsonawne
${INVALID_PASSWORD}     reshma
${INVALID_PASSWORD1}    reshma67
${ADMIN_URL}    https://staging-be.next.buyboxexperts.com/admin/user/user/

*** Keywords ***
Start Project
    OPEN BROWSER    ${LOGIN URL}    ${BROWSER}
    set window size     1900    1200

    #Maximize Browser Window


Invalid USERNAME
    CommonKeywordResource.Click CTA Button    ${CONTINUE_BUTTON}
    page should contain element     ${USERNAME_ERROR}
    Enter Username  ${BBE_USERNAME}     ${INVALID_USERNAME}
    CommonKeywordResource.Click CTA Button    ${CONTINUE_BUTTON}
    page should contain element     ${INVALID_USER_ERROR}
    Enter Username  ${BBE_USERNAME}     ${INCORRECT_EMAIL}
    CommonKeywordResource.Click CTA Button    ${CONTINUE_BUTTON}
    page should contain element     ${INCORRECT_EMAIL_ERROR}
    CommonKeywordResource.Click CTA Button    ${CONTINUE_BUTTON}

Enter Username
    [Arguments]     ${BBE_USERNAME}    ${USER NAME}
    input text    ${BBE_USERNAME}   ${USER NAME}
    sleep    3  s

Check Password
    [Arguments]     ${BBE_PASSWORD}      ${PASSWORD}
    LoginTest.Click CTA Button    ${SIGN_BUTTON}
    Enter Username      ${BBE_PASSWORD}     ${INVALID_PASSWORD}
    LoginTest.Click CTA Button    ${SIGN_BUTTON}
    page should contain element     ${PASSWORD_LENGTH_ERROR}
    Enter Username  ${BBE_PASSWORD}     ${INVALID_PASSWORD1}
    LoginTest.Click CTA Button    ${SIGN_BUTTON}
    page should contain element     ${INVALID_PASSWORD_ERROR}
    Enter Username  ${BBE_PASSWORD}     ${PASSWORD}
    LoginTest.Click CTA Button    ${SIGN_BUTTON}

Check Username Credential
    [Arguments]     ${BBE_USERNAME}    ${USER NAME}
    Invalid USERNAME
    Enter Username  ${BBE_USERNAME}     ${USER NAME}
    CommonKeywordResource.Click CTA Button    ${CONTINUE_BUTTON}


Click CTA Button
    [Arguments]    ${CONTINUE_BUTTON}
    click button    ${CONTINUE_BUTTON}
    sleep    5  s

Finish Project
    close browser

Open AdminPanel
    OPEN BROWSER    ${ADMIN_URL}    ${BROWSER}
    Maximize Browser Window
