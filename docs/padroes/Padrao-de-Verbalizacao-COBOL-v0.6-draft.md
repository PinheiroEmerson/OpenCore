OpenCore

Ferramenta de modelagem de domínio de negócio que preserva o domínio e
trata a tecnologia como substituível.

Estrutura

- docs/ --- Documentação universal (vale para qualquer domínio).

  - manifesto/ --- O pilar. O que é permanente.

  - cartilha/ --- Como aplicar o manifesto.

  - padroes/ --- Regras de verbalização (COBOL).

- dominios/ --- Um domínio por pasta.

  - banco/ --- Domínio Banco (docs, código, testes).

  - locadora/ --- Domínio Locadora (docs, código, testes).

Ordem de leitura

Consulte o docs/LEIA-ME.md para saber em que ordem ler os documentos.

Como começar

> 1\. Leia o Manifesto (docs/manifesto/).
>
> 2\. Leia a Cartilha (docs/cartilha/).
>
> 3\. Veja o exemplo do Domínio Banco (dominios/banco/docs/).
>
> 4\. Antes de codar, leia o Padrão de Verbalização (docs/padroes/).

Regra de Ouro

Se o código precisa de uma regra que não está no Domínio, pare. Atualize
o Domínio primeiro, depois o código.
