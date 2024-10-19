*** Settings ***
Documentation       This is the first test case
Library             OperatingSystem
Library             SeleniumLibrary


*** Variables ***
${URL}      https://tweakers.net/

*** Test Cases ***

Test Webpage with validation
    Open Browser    ${URL}                  Chrome
    Capture Page Screenshot
    Click Link                              Pricewatch
    Zoek via het zoekveld naar product      iPhone 15 Max Pro
    Click op de Link van iPhone 15 Pro Max
    Controleer aantal gevonden resultaten   12 uitvoeringen - Pagina 1 van 1
    [Teardown]    Close Browser


*** Keywords ***
Zoek via het zoekveld naar product
    [Arguments]     ${Zoekterm}
    Input Text                  name=keyword     ${Zoekterm}
    Click Button                class=submit
    Capture Page Screenshot

Click op de Link van iPhone 15 Pro Max
    Click Link                  xpath=//*[@id="listingContainer"]/div[2]/ul/li[1]/p/a

Controleer aantal gevonden resultaten
    [Arguments]     ${Resultaat}
    Element Text Should Be      class=pageIndex     ${Resultaat}
    Capture Page Screenshot