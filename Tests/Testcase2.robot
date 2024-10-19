*** Settings ***
Documentation       This is the second test case
Library             OperatingSystem
Library             SeleniumLibrary

*** Keywords ***
Log Gebruikersnaam
        Log         ${DICTIONARY}[username]


Log Username en Password
    [Arguments]    ${username}      ${password}
    log             ${username}
    log             ${password}


*** Variables ***
${MY-VARIABLE}      Variable Tekst oefening
${VARIABLE-2}       Deel 2 van de variable

@{LIST}             test1       test2       test3       test4

&{DICTIONARY}       username=testuser       password=demo

*** Test Cases ***

TEST Variable
    [Tags]       demotext
    Log         ${MY-VARIABLE} optellen van ${VARIABLE-2}


TEST List
    [Tags]       Tagdemo
    Log         ${LIST}[2]


TEST Dictionary

    Log         ${DICTIONARY}[username]
    Log         ${DICTIONARY}[password]


TEST Keywords
    Log Gebruikersnaam


TEST Keywords Arguments
    Log Username en Password        ${DICTIONARY}[username]     ${DICTIONARY}[password]