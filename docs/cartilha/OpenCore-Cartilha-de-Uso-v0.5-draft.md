Cartilha de Uso --- OpenCore

v0.5-draft

Status

DRAFT

Para quem é esta cartilha

Para quem nunca usou o OpenCore Manifesto.\
Para quem já usou, mas quer relembrar a ordem.\
Para quem quer entender como os artefatos se conectam.

O que é o OpenCore

OpenCore é uma ferramenta de modelagem de domínio de negócio.\
Ele não é framework, não é linguagem, não é tecnologia.\
Ele define o que é permanente (Conceito + Manipulação) e o que é
transitório (implementação, tecnologia, linguagem).\
O objetivo é preservar e evoluir o domínio --- não preservar software.

Os artefatos

O OpenCore é composto por seis artefatos:

**1. Manifesto**\
Define o permanente. Conceito, Manipulação, Transição, Evidência,
Camadas, Gramática Universal, Regra Suprema.

**2. Anexo F --- Representação Visual**\
Mostra o manifesto em diagramas. Para quem entende melhor visualmente.

**3. Cartilha de Uso**\
Este documento. Explica como aplicar.

**4. Domínio (um por domínio modelado)**\
Exemplos: Domínio Banco, Domínio Locadora. Contém Instanciação,
Modelagem e Detalhes do Domínio.

**5. Padrão de Verbalização**\
Define as regras de como traduzir o Domínio para a linguagem final (ex:
COBOL). Garante padronização sem ferir o manifesto.

**6. Mapa de Artefatos**\
Documento de controle que registra a versão e o status de todos os
outros artefatos do acervo.

Ordem de leitura

> 1\. Leia o Manifesto.
>
> 2\. Veja o Anexo F (se quiser visual).
>
> 3\. Leia esta Cartilha.
>
> 4\. Veja um Domínio (Banco ou Locadora) como exemplo.
>
> 5\. Consulte o Padrão de Verbalização antes de codificar.
>
> 6\. Consulte o Mapa de Artefatos para saber o que está vigente.

Ordem de aplicação

**Passo 1 --- Escolher o domínio**\
Decida o recorte. Ex: Banco. Hospital. Escola. Locadora.

**Passo 2 --- Instanciar**\
Defina a fronteira: O que entra, O que não entra, Atores, Motivo,
Fronteira declarada. Materialize a Instanciação.

**Passo 3 --- Modelar Conceitos**\
Liste candidatos a Conceito. Aplique o Teste de Identificação Conceitual
(Se a implementação desaparecer, a ideia continua existindo? SIM →
Conceito; NÃO → fora).

**Passo 4 --- Modelar Manipulações**\
Toda Manipulação deve ser expressa como ação sobre um Conceito nomeado.

**Passo 5 --- Registrar Evidências**\
Toda Manipulação produz Transição. Toda Transição deixa Evidência (Quem,
Quando, Por quê, Como).

**Passo 6 --- Twilight Zone e Pendências**\
O que não foi resolvido, registre como exceção ou pendência. Não é
depósito, é rastreabilidade.

**Passo 7 --- Materializar a Modelagem**\
Salve junto com a Instanciação. Um domínio, um documento.

**Passo 8 --- Verbalizar**\
Após materializar a Modelagem, a próxima etapa é a Verbalização
(tradução para a linguagem final). Consulte o **Padrão de Verbalização**
(ex: COBOL) para as regras de código.

Princípios de aplicação

**1. Complexidade excessiva é sinal de modelagem errada.**\
**2. Crescimento por adição, não por reescrita.**\
**3. Um Conceito pode ter várias instâncias.**\
**4. Ator não é Conceito.**\
**5. Evidência não é Conceito.**

O que evitar

**1. Criar Conceito sem passar no Teste.**\
**2. Criar camada intermediária.**\
**3. Confundir domínio com manifesto.**\
**4. Testar o manifesto além do escopo.**\
**5. Fazer meta-discurso.**

Quando o manifesto evolui

O manifesto evolui quando um aprendizado se prova universal, uma nova
camada é necessária, ou um Conceito universal aparece. Não evolui quando
é específico de um domínio, é meta-discurso ou é parafernalha.

Exemplos aplicados

Veja os documentos Domínio: Banco e Domínio: Locadora para exemplos
completos.

Referência

Esta cartilha aplica o **OpenCore Manifesto v0.3-draft**.

Evolução da Cartilha

**v0.1-draft**\
Versão inicial. Escrita após a modelagem do Banco.

**v0.2-draft**\
Adicionadas orientações sobre como decidir o que entra/sai na
Instanciação. Adicionada distinção entre Conceito, Manipulação,
Atributo, Estado, Evidência e Ator.

**v0.3-draft**\
Inclusão do artefato \"Padrão de Verbalização\" na lista de artefatos.
Inclusão do Passo 8 na ordem de aplicação.

**v0.4-draft**\
Correção no Passo 8 e na lista de artefatos para não restringir a
Verbalização apenas ao COBOL.

**v0.5-draft**\
Inclusão do Mapa de Artefatos como o 6º artefato oficial. Atualização da
ordem de leitura para incluir a consulta ao Mapa. Limpeza visual da
seção de evolução.
