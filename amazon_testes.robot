*** Settings ***
Resource               amazon_resources.robot
Test Setup             Abrir o navegador
Test Teardown          Fechar o navegador


*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Eletronicos"
    [Documentation]    Esse teste verificar o menu "Eletronicos" do site da Amazon.com.br
    [Tags]             menus
    Acessar a home page do site Amazon.com.br
    Verificar se o titulo da pagina fica "Amazon.com.br | Tudo pra você, de A a Z."
    Entrar no menu "Eletronicos"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se o titulo da pagina fica "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a categoria "Computadores e Informática"

Caso de Teste 02 - Pesquisa de um produto
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]             busca_produtos
    Acessar a home page do site Amazon.com.br
    Digitar o nome do produto "Xbox Series S" no campo de Pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Xbox Series S"