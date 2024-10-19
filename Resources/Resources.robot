*** Settings ***
Documentation       This is the first test case
Library             OperatingSystem
Library             SeleniumLibrary

*** Keywords ***
Klik op de knop rechts onder om naar de volgende pagina te gaan
    Wait Until Element Is Visible       id:_eventId_volgende
    Sleep                               1s
    Capture Page Screenshot
    Click Button                        id:_eventId_volgende
    Sleep                               1s

Kies bij Verzekering voor: "Uzelf"
    Wait Until Element Is Visible       id:label_contract_gezinssituatie1
    Click Element                       id:label_contract_gezinssituatie1

Kies voor Gewenste verzekering voor "zonder eigen risico"
    Sleep                               1s
    Click Element                       id:bedrag_aansprakelijkheid_hoog_zonder

Vul voor het veld
    [Arguments]     ${Selector}         ${Value}
    Input Text    id=${Selector}       ${Value}

Klik op Geslacht Man
    Click Element    id=label_aanvrager_geslacht1

Klik bij Heeft u nog opmerkingen op Nee
    Click Element    id=label_contract_zijnErOpmerkingen2

Zet een vink "bij Ik begrijp deze uitleg en vul de vragen eerlijk in"
    Click Element    xpath=//*[@id="webmoduleform"]/div/fieldset[3]/div[1]/div[3]/ins

Zet vervolgens alle Radiobuttons op Nee
    Click Element       xpath=//*[@id="keuzes.verklaring0"]/li[2]/div/ins
    Click Element       xpath=//*[@id="keuzes.verklaring1"]/li[2]/div/ins
    Click Element       xpath=//*[@id="keuzes.verklaring2"]/li[2]/div/ins
    Click Element       xpath=//*[@id="keuzes.verklaring3"]/li[2]/div/ins
    Click Element       xpath=//*[@id="keuzes.verklaring4"]/li[2]/div/ins

Klik op "Ik ben akkoord met onderstaande bepalingen:"
    Click Element       xpath=//*[@id="webmoduleform"]/div/fieldset[4]/div[2]/div[2]/ins

Controleer dat voor
    [Arguments]     ${Selector}         ${Value}
    Element Text Should Be           id=${Selector}       ${Value}