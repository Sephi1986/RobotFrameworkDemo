*** Settings ***
Documentation       This is the first test case
Library             OperatingSystem
Library             SeleniumLibrary


*** Variables ***
${URL}      https://tweakers.net/



*** Test Cases ***

Test Webpage with validation tweakers
    Open Browser    ${URL}      chrome      options=add_argument("--disable-search-engine-choice-screen")
    Capture Page Screenshot

    Sleep           2s
#    Click Element       id=pg-accept-btn
#    Click Link                              Pricewatch
#    Zoek via het zoekveld naar product      iPhone 15 Max Pro
#    Click op de Link van iPhone 15 Pro Max
#    Controleer aantal gevonden resultaten   12 uitvoeringen - Pagina 1 van 1
    [Teardown]    Close Browser


*** Keywords ***

#Open Headless Browser
#    Set Environment Variable ${browser}
#    Set Environment Variable ${URL}
#    ${options} Evaluate sys.modules[‘selenium.webdriver’].${browser}Options()
#    … modules=sys, selenium.webdriver
#    Call Method ${options} add_argument --headless
#    Create Webdriver ${browser} ${options}
#    Go To ${URL}

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