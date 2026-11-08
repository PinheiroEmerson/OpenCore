OpenCore Manifesto

v0.3-draft

Status

DRAFT

Propósito

Preservar e evoluir o domínio. Não preservar software, linguagem,
framework, banco de dados ou tecnologia específica.

Fundamentos

> 1\. O negócio é o centro.
>
> 2\. Conceitos são permanentes.
>
> 3\. Implementações são transitórias.
>
> 4\. Crescimento por adição, não por reescrita.
>
> 5\. Toda manipulação deve ser rastreável.

Núcleo do Manifesto

Conceitos + Manipulações

Critério de Pertinência ao Núcleo

Um elemento só permanece no manifesto quando é aplicável a qualquer
domínio de negócio analisado.

Elementos válidos apenas para contextos específicos devem existir na
modelagem do domínio, não no manifesto.

Camadas

O manifesto se aplica através de quatro camadas distintas, em ordem:

**Manifesto → Instanciação → Modelagem → Verbalização**

**Manifesto**\
Define o que é permanente: Conceitos, Manipulações, Transições,
Evidências e a Gramática Universal. Não contém domínio específico.

**Instanciação**\
Define o recorte de um domínio. É decisão deliberada. Define fronteira.

**Modelagem**\
Descreve os Conceitos e Manipulações dentro da fronteira declarada. É
descoberta. Cresce por adição.

**Verbalização**\
Expressa a modelagem em alguma linguagem ou mecanismo. É o meio de
execução. Nunca é o core.

**Regra de Fronteira**

Instanciação define fronteira. Modelagem cresce dentro da fronteira.\
Mudar fronteira é decisão deliberada. Crescer dentro da fronteira é
adição natural.

Definição de Conceito

Um conceito deve existir independentemente de qualquer tecnologia,
mecanismo ou forma de implementação.

Princípio da Independência Conceitual

Se a existência de algo depende de uma implementação específica, então
esse algo não é um conceito, mas a própria implementação.

Teste de Identificação Conceitual

Se a implementação desaparecer, a ideia continua existindo? Se sim, é
candidata a conceito. Se não, trata-se de implementação, mecanismo ou
detalhe operacional.

Este teste é permanente e se aplica a toda e qualquer inclusão no
núcleo.

Manipulações

Manipulação é ação aplicada sobre um conceito.

Manipulações representam ações aplicadas sobre conceitos. Toda
manipulação produz uma transição de estado sobre o conceito manipulado.

Transições e Evidências

Toda transição deve ser explicável por evidências mínimas: Quem, Quando,
Por quê e Como.

O \"Por quê\" é o propósito da transição. Ele responde por que a
transição existe dentro do domínio, e não apenas o que aconteceu.

Uma transição sem propósito é registro. Uma transição com propósito é
domínio.

O manifesto preserva domínio, não registro.

**Observação sobre Auditoria**

Auditoria não é camada. Surge naturalmente da rastreabilidade das
manipulações e transições.

Quando toda manipulação gera uma transição rastreável, a auditoria
emerge naturalmente das evidências produzidas. Criar uma camada
específica de auditoria duplicaria responsabilidades já atendidas pela
rastreabilidade.

Gramática Universal

A verbalização de qualquer domínio, em qualquer área, responde a cinco
perguntas:

> 1\. O que existe?
>
> 2\. O que pode ser feito?
>
> 3\. O que mudou?
>
> 4\. Quem pode dizer que mudou?
>
> 5\. Por que mudou?

Essas perguntas são declarativas. Não exemplificadas. Exemplos pertencem
à Modelagem de cada domínio.

O Que Está Fora do Núcleo

Tecnologias, linguagens, protocolos, persistência, interfaces,
frameworks, mecanismos e detalhes operacionais.

Gestão de Mudanças Minimalista

Toda mudança deve responder:

- O que mudou?

- Por que mudou?

- O que foi afetado?

- Trata-se de Correção, Evolução ou Revisão de Domínio?

Regra Suprema

O domínio deve sobreviver. Implementações são substituíveis.

Validação

O manifesto foi aplicado a Banco e Locadora.

Anexos

Anexo A --- Decisões de Simplificação do Manifesto

Este anexo registra decisões deliberadas para evitar que futuras versões
reintroduzam complexidade já analisada e descartada.

**1. Mecanismos foram removidos do núcleo.**\
Motivo: mecanismos representam meios de execução, não o negócio. PIX,
REST, chatbot, terminal, aplicativo móvel ou qualquer tecnologia futura
apenas provocam manipulações. Como podem mudar sem alterar o domínio,
não pertencem ao núcleo.

**2. Situações foram removidas do manifesto.**\
Motivo: a ideia funcionava para alguns domínios, mas não se mostrou
universal. Estados como aberta, bloqueada ou encerrada faziam sentido
para contas, porém não se aplicavam da mesma forma a outros conceitos. A
abstração não era suficientemente geral para integrar o manifesto.

**3. Atributos foram removidos do manifesto.**\
Motivo: atributos pertencem à modelagem específica de cada conceito.
Saldo, endereço, limite, matrícula ou qualquer outra característica
variam conforme o domínio. O manifesto deve permanecer acima desse nível
de detalhamento.

Anexo B --- Inclusão do Princípio da Independência Conceitual

(Incorporado na v0.2. Mantido na v0.3.)

Durante os testes, verificou-se que conceitos sobrevivem sem
implementações, enquanto implementações não sobrevivem sem conceitos.

Exemplos: Pagamento sobrevive sem PIX; Fixação sobrevive sem cadarço;
Progressão sobrevive sem XP.

Decisão: incorporar formalmente o Princípio da Independência Conceitual
ao manifesto.

Anexo C --- Por que a Cadeia de Camadas Existe

A separação entre Manifesto, Instanciação, Modelagem e Verbalização
evita que decisões de recorte contaminem a modelagem, e que decisões de
linguagem contaminem o domínio.

Sem essa separação, toda mudança de recorte força reescrita da
modelagem, violando o Fundamento 4 (crescimento por adição, não por
reescrita).

Anexo D --- Por que a Linguagem Nunca é o Core

O domínio é o que sobrevive. A linguagem é o meio pelo qual o domínio se
expressa em um dado momento.

COBOL, nesta primeira verbalização, é meio --- nunca fim. Se amanhã
outra linguagem servir melhor, a modelagem permanece, e apenas a
verbalização muda.

Anexo E --- Por que o Manual Fica para Depois

O manual é operacional. Só pode existir depois que pelo menos um domínio
estiver modelado de verdade.

Manual escrito antes disso vira teoria --- e teoria não valida
manifesto.

Anexo F --- Representação Visual do Manifesto

(A representação visual do manifesto é mantida em documento separado, em
formato de diagrama. Não integra o corpo textual para preservar a
legibilidade e a portabilidade do documento.)

Acervo e Evolução

- **v0.1-draft-r1:** consolidação inicial do manifesto e decisões de
  simplificação.

- **v0.2-draft-congelado:** inclusão do Princípio da Independência
  Conceitual e refinamento do núcleo para Conceitos + Manipulações.
  (Substituída por v0.3-draft.)

- **v0.3-draft:** formalização da cadeia de camadas, promoção do Teste
  de Identificação Conceitual ao núcleo, explicitação da Gramática
  Universal, correção da lacuna de transição, restauração do critério de
  pertinência, restauração do porquê completo das decisões de
  simplificação, restauração da observação sobre auditoria como regra
  viva, restauração da validação empírica e registro da evolução
  vocabular \"Objetivo\" → \"Propósito\".

Pendências Registradas

- Nenhuma pendência ativa. Leitor-alvo definido como analista.
  Representação visual materializada em documento próprio.

Nota Final

Este manifesto não descreve tecnologia. Descreve o que permanece quando
a tecnologia muda.
