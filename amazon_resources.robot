*** Settings ***
Library                             SeleniumLibrary

*** Variables ***
${URL}                              https://www.amazon.com.br/
${MENU_ELETRONICOS}                 //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}               //h1[contains(.,'Eletrônicos e Tecnologia')]
${INPUT_TEXT}                       //input[contains(@type,'text')]
${BUTTON_SUBMIT}                    //input[contains(@type,'submit')]

*** Keywords ***
Abrir o navegador
    Open Browser                    browser=chrome           
    Maximize Browser Window
Fechar o navegador
    Capture Page Screenshot
    Close Browser
Acessar a home page do site Amazon.com.br
    Go To                            url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}
Entrar no menu "Eletronicos"
   Click Element                     locator=${MENU_ELETRONICOS} 
Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains         text=${FRASE}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}
Verificar se o titulo da pagina fica "${TITULO}"
    Title Should Be                  title=${TITULO}
Verificar se aparece a categoria "${CATEGORIA}"
    Element Should Be Visible        locator=css:a>[alt="${CATEGORIA}"]
Digitar o nome do produto "${PRODUTO}" no campo de Pesquisa
    Input Text                       locator=${INPUT_TEXT}    text=${PRODUTO}
Clicar no botão de pesquisa
    Click Element                    locator=${BUTTON_SUBMIT}
Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=(//a[contains(.,'${PRODUTO}')])[4]
    