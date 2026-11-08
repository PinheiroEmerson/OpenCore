# OpenCore Manifesto

## v0.2-draft-congelado

---

## Status

CONGELADO

---

## Propósito

Preservar e evoluir o domínio. Não preservar software, linguagem, framework, banco de dados ou tecnologia específica.

---

## Fundamentos

1. O negócio é o centro.
2. Conceitos são permanentes.
3. Implementações são transitórias.
4. Crescimento por adição, não por reescrita.
5. Toda manipulação deve ser rastreável.

---

## Núcleo do Manifesto

Conceitos + Manipulações

---

## Definição de Conceito

Um conceito deve existir independentemente de qualquer tecnologia, mecanismo ou forma de implementação.

---

## Princípio da Independência Conceitual

Se a existência de algo depende de uma implementação específica, então esse algo não é um conceito, mas a própria implementação.

---

## Teste de Identificação Conceitual

Se a implementação desaparecer, a ideia continua existindo? Se sim, é candidata a conceito. Se não, trata-se de implementação, mecanismo ou detalhe operacional.

---

## Manipulações

Manipulações representam ações aplicadas sobre conceitos. Toda manipulação produz uma transição.

---

## Rastreabilidade

Toda transição deve ser explicável por evidências mínimas: Quem, Quando, Por quê e Como.

---

## O Que Está Fora do Núcleo

Tecnologias, linguagens, protocolos, persistência, interfaces, frameworks, mecanismos e detalhes operacionais.

---

## Gestão de Mudanças Minimalista

Toda mudança deve responder: O que mudou? Por que mudou? O que foi afetado? Trata-se de Correção, Evolução ou Revisão de Domínio?

---

## Regra Suprema

O domínio deve sobreviver. Implementações são substituíveis.

---

## Anexo A - Decisões de Simplificação

Auditoria removida como camada: a auditoria emerge naturalmente da rastreabilidade.

Mecanismos removidos do núcleo: são meios de execução e não elementos do domínio.

Situações removidas: não se mostraram universais entre os domínios analisados.

Atributos removidos: pertencem à modelagem específica de cada domínio.

---

## Anexo B - Inclusão do Princípio da Independência Conceitual

Durante os testes, verificou-se que conceitos sobrevivem sem implementações, enquanto implementações não sobrevivem sem conceitos.

Exemplos: Pagamento sobrevive sem PIX; Fixação sobrevive sem cadarço; Progressão sobrevive sem XP.

Decisão: incorporar formalmente o Princípio da Independência Conceitual ao manifesto.

---

## Acervo e Evolução

v0.1-draft-r1: consolidação inicial do manifesto e decisões de simplificação.

v0.2-draft-congelado: inclusão do Princípio da Independência Conceitual e refinamento do núcleo para Conceitos + Manipulações.
