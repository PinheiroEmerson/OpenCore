Anexo F --- Representação Visual do Manifesto

OpenCore Manifesto v0.3-draft

Status

DRAFT

Nota

Este documento é o Anexo F do OpenCore Manifesto v0.3-draft.

A representação visual é mantida em documento separado para preservar a
legibilidade e a portabilidade do manifesto.

O objetivo deste anexo é oferecer uma leitura estrutural do manifesto
para leitores que compreendem melhor diagramas do que texto linear.

Como ler este anexo

Os quatro fluxos, juntos, contam a história completa do manifesto:

- Fluxo 1 mostra o que o manifesto é.

- Fluxo 2 mostra como o manifesto é aplicado.

- Fluxo 3 mostra o que pertence e o que não pertence ao núcleo.

- Fluxo 4 mostra como o manifesto evoluiu até aqui.

Os fluxos são apresentados como sequências de etapas. Cada etapa tem
nome e conteúdo. A ordem é de cima para baixo, seguindo o fluxo de
dependência.

Fluxo 1 --- O Cerne

O que este fluxo representa

O Fluxo 1 apresenta a estrutura conceitual do manifesto, de cima para
baixo. Começa pela Regra Suprema (o que sustenta tudo), passa pelo
Núcleo (Conceitos + Manipulações), atravessa o Teste de Identificação (o
filtro), desce pelas Camadas (como o manifesto se aplica) e termina na
Gramática Universal (as perguntas que toda modelagem responde).

Como ler

Leia de cima para baixo. Cada etapa depende da anterior. A Regra Suprema
sustenta o Núcleo. O Núcleo é filtrado pelo Teste. O Teste alimenta as
Camadas. As Camadas se expressam através da Gramática Universal.

Estrutura

**1. REGRA SUPREMA**

> O domínio deve sobreviver.\
> Implementações são substituíveis.

**2. NÚCLEO**

> Conceitos + Manipulações

- Conceito = o que existe

- Manipulação = o que pode ser feito

**3. TRANSIÇÃO E EVIDÊNCIAS**

> Toda manipulação produz uma transição.\
> Toda transição deixa evidências.\
> (Quem / Quando / Por quê / Como)

**4. TESTE DE IDENTIFICAÇÃO**

> Se a implementação desaparecer, a ideia continua existindo?

- SIM → é Conceito (entra no núcleo)

- NÃO → é implementação (fica fora)

**5. CAMADAS**

> Manifesto → Instanciação → Modelagem → Verbalização
>
> Regra de Fronteira:\
> Instanciação define fronteira. Modelagem cresce dentro da fronteira.

**6. GRAMÁTICA UNIVERSAL**

> 1\. O que existe?
>
> 2\. O que pode ser feito?
>
> 3\. O que mudou?
>
> 4\. Quem pode dizer que mudou?
>
> 5\. Por que mudou?

Fluxo 2 --- Aplicação

O que este fluxo representa

O Fluxo 2 apresenta como o manifesto é aplicado, do início ao fim.
Começa pela escolha do domínio, passa pela Instanciação (que define a
fronteira), entra na Modelagem (que descobre Conceitos e Manipulações),
atravessa o Teste de Identificação (que filtra o que entra no núcleo),
desce pra Verbalização (que expressa em alguma linguagem) e termina em
Transições + Evidências (que geram auditoria naturalmente).

Como ler

Leia de cima para baixo. Cada etapa é uma camada da aplicação. A ordem
importa: não se modela antes de instanciar, não se verbaliza antes de
modelar.

Estrutura

**1. DOMÍNIO ESCOLHIDO**

> Exemplo: Banco.

**2. INSTANCIAÇÃO**

> \"Vou trabalhar com Banco.\"\
> Define fronteira (decisão).

**3. MODELAGEM**

> Quais Conceitos existem?\
> Quais Manipulações existem?\
> Cresce por adição (descoberta).

**4. TESTE DE IDENTIFICAÇÃO**

> Isso sobrevive sem implementação?

- SIM → entra no núcleo

- NÃO → fica fora

**5. VERBALIZAÇÃO**

> COBOL, JSON, REST, o que for.\
> Meio de execução. Nunca o core.

**6. TRANSIÇÕES + EVIDÊNCIAS**

> Quem / Quando / Por quê / Como.\
> Auditoria emerge naturalmente.

Fluxo 3 --- Dentro vs Fora

O que este fluxo representa

O Fluxo 3 apresenta a separação entre o que pertence ao núcleo do
manifesto e o que está fora dele. À esquerda (Dentro) estão os elementos
permanentes, que sobrevivem à implementação. À direita (Fora) estão os
elementos transitórios, que podem mudar sem alterar o domínio. No
centro, o Critério de Pertinência decide onde cada elemento mora.

Como ler

Leia as duas colunas lado a lado. Tudo que está \"Dentro\" permanece.
Tudo que está \"Fora\" é substituível. O Critério de Pertinência é o
filtro que decide.

Estrutura

**DENTRO:**\
Conceito, Manipulação, Transição, Evidência (Quem / Quando / Por quê /
Como).\
Permanece. Sobrevive à implementação.

**FORA:**\
Tecnologia, Linguagem, Protocolo, Persistência, Interface, Framework,
Mecanismo, Detalhe operacional.\
Substituível.

**CRITÉRIO DE PERTINÊNCIA**

> Aplicável a QUALQUER domínio de negócio? → DENTRO\
> Só para contextos específicos? → FORA (vai pra Modelagem)

Fluxo 4 --- Evolução das Versões

O que este fluxo representa

O Fluxo 4 apresenta como o manifesto evoluiu da v0.1 até a v0.3. Cada
versão contribuiu com algo diferente: a v0.1 trouxe o DNA (Conceitos,
Manipulações, Rastreabilidade, Regra Suprema). A v0.2 refinou (Princípio
da Independência Conceitual). A v0.3 estruturou (Camadas, Gramática,
Teste promovido, Critério de Pertinência, Anexos C a F). As três
convergem para o Manifesto Vivo, que segue evoluindo.

Como ler

Leia as três versões em paralelo. Cada coluna mostra o que aquela versão
acrescentou. As três convergem para o Manifesto Vivo.

Estrutura

**v0.1 (DNA):**\
Conceitos, Manipulações, Rastreabilidade, Regra Suprema, Anexos A,
Validação.

**v0.2 (Refinamento):**

- Princípio da Independência Conceitual.

**v0.3 (Estrutura):**

- Camadas, + Gramática, + Teste promovido, + Critério de Pertinência, +
  Anexos C, D, E, F, + Merge completo.

**CONVERGÊNCIA**

> As três versões convergem para o MANIFESTO VIVO.\
> O Manifesto Vivo não é uma versão específica. É o manifesto em
> movimento, evoluindo há 30+ anos.

Referência

Este documento aplica o OpenCore Manifesto v0.3-draft.

- Manifesto: define o permanente.

- Anexo F: representa visualmente a estrutura do manifesto.
