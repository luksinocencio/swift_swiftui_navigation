#  <#Title#>

O papel de cada Router
AppRouter: controla o fluxo global da aplicação (login ↔ área autenticada).
HomeRouter: controla apenas a pilha de navegação da aba Home.
DetailsRouter: controla apenas a pilha da aba Detalhes.

Essa separação evita que um único router fique responsável por toda a navegação do app, facilita testes e permite preservar o histórico de cada aba, exatamente como os aplicativos nativos do iOS fazem.
