*** Settings ***
Library     SeleniumLibrary
Resource    ../../Resources/4788R.robot
Resource    ../../Resources/LoginTest.robot

*** Variables ***
${USER NAME}    rsonawne@buyboxexperts.com
${USER PASSWORD}    reshma57

*** Test Cases ***
Breakdown std services
    #set selenium speed      0.5
    start project
    #Open Browser To Login Page      ${url}      ${BROWSER}
    Enter Username   ${BBE_USERNAME}    ${USER NAME}
    LoginTest.Click CTA Button     ${CONTINUE_BUTTON}
    Enter Username    ${BBE_PASSWORD}   ${USER PASSWORD}
    LOGINTEST.CLICK CTA BUTTON    ${SIGN_BUTTON}

    #Enter Login Details     ${Email}    ${Password}
    #Heading to req company tab      ${company_name}
    Heading to statement of work
    close browser
#    By default agency fee 15%
    #Decrement should be of 1%