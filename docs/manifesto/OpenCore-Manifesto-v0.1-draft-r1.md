# OpenCore Manifesto

## v0.1-draft-r1

---

## Status

CONGELADO

---

## Objetivo

Preservar e evoluir o domínio. Não preservar software. Não preservar tecnologia.

---

## Princípios Fundamentais

1. O negócio é o centro.
2. Conceitos são permanentes.
3. Implementações são transitórias.
4. Crescimento por adição, não por reescrita.
5. Toda manipulação deve ser rastreável.

---

## Núcleo

Conceitos + Manipulações

---

## Definições

Conceito: elemento fundamental do domínio.
Manipulação: ação aplicada sobre um conceito.
Toda manipulação gera uma transição.
Toda transição deve deixar evidências.

---

## Rastreabilidade Mínima

Quem? Quando? Por quê? Como?

---

## Fora do Núcleo

Tecnologia, linguagem, persistência, protocolo, interface, framework e mecanismos.

---

## Gestão de Mudança Minimalista

O que mudou?
Por que mudou?
O que foi afetado?
Correção, Evolução ou Revisão de Domínio?

---

## Validação

Aplicado a Banco, Hospital, Escola, Locadora, Loja e RH.

---

## Regra Suprema

O domínio deve sobreviver. Implementações são substituíveis.

---

## Observação

Auditoria não é camada. Surge naturalmente da rastreabilidade das manipulações e transições.

---

## Anexo A - Decisões de Simplificação do Manifesto

Este anexo registra decisões deliberadas para evitar que futuras versões reintroduzam complexidade já analisada e descartada.

1. Auditoria foi removida como camada. Motivo: constatou-se que auditoria não é um elemento independente do domínio. Quando toda manipulação gera uma transição rastreável, a auditoria emerge naturalmente das evidências produzidas. Criar uma camada específica de auditoria duplicaria responsabilidades já atendidas pela rastreabilidade.

2. Mecanismos foram removidos do núcleo. Motivo: mecanismos representam meios de execução, não o negócio. PIX, REST, chatbot, terminal, aplicativo móvel ou qualquer tecnologia futura apenas provocam manipulações. Como podem mudar sem alterar o domínio, não pertencem ao núcleo.

3. Situações foram removidas do manifesto. Motivo: a ideia funcionava para alguns domínios, mas não se mostrou universal. Estados como aberta, bloqueada ou encerrada faziam sentido para contas, porém não se aplicavam da mesma forma a outros conceitos. A abstração não era suficientemente geral para integrar o manifesto.

4. Atributos foram removidos do manifesto. Motivo: atributos pertencem à modelagem específica de cada conceito. Saldo, endereço, limite, matrícula ou qualquer outra característica variam conforme o domínio. O manifesto deve permanecer acima desse nível de detalhamento.

5. Critério adotado. Um elemento só permanece no manifesto quando é aplicável a qualquer domínio de negócio analisado. Elementos válidos apenas para contextos específicos devem existir na modelagem do domínio, não no manifesto.

Resultado da simplificação: o núcleo permaneceu reduzido a Conceitos e Manipulações, com a regra obrigatória de que toda manipulação produz uma transição rastreável.
