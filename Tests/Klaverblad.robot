*** Settings ***
Documentation       This is the first test case
Library             OperatingSystem
Library             SeleniumLibrary
Library             DateTime
Resource            ..//Resources/Resources.robot

*** Variables ***
${URL}      https://www.klaverblad.nl/berekenen-en-afsluiten-verzekeringspakket.htm


*** Test Cases ***

Test Webpage with validation
    ${DatumVandaag}     Get Current Date    result_format=%d-%m-%Y

    Open Browser     ${URL}      headlesschrome      options=add_argument("--disable-search-engine-choice-screen")

    Maximize Browser Window
    Click Accepteer cookies

    Controleer dat de pagina Premie berekenen Verzekeringspakket is geopend
    Klik op Aansprakelijkheidsverzekering
    Klik op de knop rechts onder om naar de volgende pagina te gaan

    Kies bij Verzekering voor: "Uzelf"
    Kies voor Gewenste verzekering voor "zonder eigen risico"
    Klik op de knop rechts onder om naar de volgende pagina te gaan

    Klik op de knop rechts onder om naar de volgende pagina te gaan

    Vul voor het veld   aanvrager.voorletters                   D.E.M.O.
    Vul voor het veld   aanvrager.achternaam                    RobotFrameWork
    Klik op Geslacht Man
    Vul voor het veld   aanvrager.geboortedatum                 D.E.M.O.
    Vul voor het veld   aanvrager.adres.postcode                2652JB
    Vul voor het veld   aanvrager.adres.huisnummer.nummer       23
    Vul voor het veld   aanvrager.telefoon                      0612312312
    Vul voor het veld   aanvrager.geboortedatum                 21-09-1980
    Vul voor het veld   aanvrager.email                         test@klaverblad.nl
    Vul voor het veld   aanvrager.geboortedatum                 21-09-1980
    Vul voor het veld   aanvrager.email                         test@klaverblad.nl

    Vul voor het veld   contract.rekening                       NL05RABO9007769359
    Vul voor het veld   aansprakelijkheidsverzekering.contract.ingangsdatum     ${DatumVandaag}

    Klik bij Heeft u nog opmerkingen op Nee
    Zet een vink "bij Ik begrijp deze uitleg en vul de vragen eerlijk in"

    Zet vervolgens alle Radiobuttons op Nee
    Klik op "Ik ben akkoord met onderstaande bepalingen:"

    Klik op de knop rechts onder om naar de volgende pagina te gaan

    #Controleer dat voor                 waarde.vn.volledigenaam         D.E.M.O. RobotFrameWork
    #Controleer dat voor                 waarde.vn.straat                Rietmeerplantsoen
    Controleer dat voor                 waarde.vn.huisnummer            23
    Controleer dat voor                 waarde.vn.plaats                Berkel en Rodenrijs
    Capture Page Screenshot

    [Teardown]    Close Browser

*** Keywords ***
Click Accepteer cookies
    Sleep           2s
    Click Element    id=bcAcceptAll

Controleer dat de pagina Premie berekenen Verzekeringspakket is geopend
    Page Should Contain Element         id:Premie_berekenen_Verzekeringsp-anchor
    Select Frame                        id:webmodule-iframe

Klik op Aansprakelijkheidsverzekering
    Click Element                       id:label_gewenste_verzekeringen3




