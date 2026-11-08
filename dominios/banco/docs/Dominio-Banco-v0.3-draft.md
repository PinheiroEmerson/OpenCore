Domínio: Banco

v0.3-draft

Status

DRAFT

Referência

Este documento aplica o OpenCore Manifesto v0.3-draft.

- Manifesto: define o permanente (Conceitos + Manipulações).

- Instanciação: define a fronteira deste domínio.

- Modelagem: descreve Conceitos e Manipulações dentro da fronteira.

Instanciação

Tipo

Banco comercial mínimo, com operações essenciais.

O que entra

- Abrir conta

- Depositar

- Sacar

- Transferir

- Consultar saldo

- Encerrar conta

O que não entra (por enquanto)

- Empréstimo

- Investimento

- Câmbio

- Cartão de crédito

- Seguros

- Tarifas complexas

Atores

- Cliente

- Operador

- Sistema automático

Motivo do recorte

Iniciar o teste do manifesto sem complexidade desnecessária.

Crescimento por adição. Se falhar, falha pequeno.

Fronteira declarada

Qualquer coisa fora da lista \"O que entra\" pertence a outro domínio ou
a uma futura expansão deliberada.

Mudar fronteira é decisão deliberada. Crescer dentro da fronteira é
adição natural.

Modelagem Conceitual

Convenção do Domínio

Toda Manipulação deve ser expressa como ação sobre um Conceito nomeado.

Conceito

Conta

Conceito central do domínio Banco. Único Conceito identificado até o
momento.

Conta é o substrato onde as movimentações acontecem. Toda Manipulação
age sobre Conta.

Conta não tem dono, não tem proprietário, não tem vínculo. Tem Evidência
de quem se relaciona com ela.

Atores

Atores não são Conceitos. São quem age no domínio. Já declarados na
Instanciação.

- Cliente

- Operador

- Sistema automático

Manipulações

Toda Manipulação é ação sobre Conta.

Abrir

Age sobre: Conta

Depositar

Age sobre: Conta

Sacar

Age sobre: Conta

Transferir

Age sobre: Conta (duas instâncias --- origem e destino).

**Transferência Interna:** age sobre duas Contas do mesmo banco.\
**Transferência Externa:** age sobre uma Conta do banco (origem) e tem
como destino uma conta em outro domínio (Twilight Zone). O dinheiro sai
da origem; se for rejeitado, retorna.

Consultar

Age sobre: Conta

Encerrar

Age sobre: Conta

Evidências

Toda Manipulação produz Transição. Toda Transição deixa Evidência.

Evidência mínima: Quem, Quando, Por quê, Como.

Transação

Transação é Evidência. É o registro do que aconteceu. Não é Conceito,
não é Manipulação.

Movimentação

Movimentação é Manipulação. É a ação de mover algo na Conta. Não é
Conceito.

Proprietário, Dono, Vínculo, Terceiro

São relações. Não são Conceitos, não são Manipulações. São Evidência de
quem se relaciona com a Conta.

Detalhes do Domínio

*(Atributos, regras de negócio e estrutura de evidência, capturados na
conversa com o dono do negócio. São necessários para a Verbalização, mas
não são Conceitos Universais.)*

Atributos Essenciais

**Conta:**

- Número da Conta

- Saldo

- Status (Ativa / Encerrada)

**Atores:**

- Cliente: Nome, CPF, Endereço (opcional)

- Operador: Matrícula

**Transação:**

- Valor

- Data e Hora

- Canal (Código de 2 dígitos)

- Tipo de Transação (Código de 2 dígitos)

- Histórico (Texto descritivo gerado pelo sistema)

Tabelas de Domínio (A Fonte da Paridade)

Para garantir que não exista divergência (o famoso \"bangu\"), os
códigos e suas descrições são fixos e imutáveis no sistema.

**Tabela de Canais:**

- 01 = Caixa

- 02 = ATM

- 03 = App

- 04 = Web

- 05 = Terminal

**Tabela de Tipos de Transação:**

- 01 = Depósito

- 02 = Saque

- 03 = Transferência

- 04 = Pagamento

Regras de Negócio

- **Saque:** limitado ao saldo disponível. Proibido valores negativos.

- **Depósito:** proibido valores negativos.

- **Encerramento:** conta com status \"Encerrada\" não movimenta. O
  encerramento só é permitido se o saldo for zero.

- **Transferência Interna:** o dinheiro não pode sumir no meio do
  caminho. Ou sai de uma conta e entra na outra, ou não sai de nenhuma.

- **Transferência Externa:** o débito é feito primeiro. Se o outro banco
  rejeitar, o valor retorna para a conta de origem (retorno). O retorno
  não pode ser duplicado. O cliente deve ser informado.

- **Limite de Transferência:** acima de
  R$5.000exigeautoriza\overset{\backslash c}{c}\widetilde{a}o;acimadeR$
  50.000 exige gerente e compliance.

- **Limite de Saque (ATM):** R\$ 1.000 por dia por cartão.

- **Retorno de Transferência Externa:** deve registrar o motivo da
  rejeição usando a lista de códigos padronizada (FEBRABAN).

- **Informação ao Cliente:** O cliente deve ser informado em caso de
  rejeição e retorno de transferência externa.

- **Regra de Paridade e Histórico:** A descrição do Histórico da
  Transação NUNCA é digitada pelo cliente. Ela é gerada pelo sistema,
  obrigatoriamente, concatenando a Descrição do Tipo de Transação + a
  Descrição do Canal (ex: \"Depósito - ATM\").

Estrutura da Evidência (Regras de Domínio)

- **Tipos de Evidência:** Movimento (dinheiro mudou), Acesso (informação
  consultada), Cadastro (dado do cliente alterado).

- **Correlação:** Toda Evidência de uma mesma operação (ex:
  transferência) deve possuir o mesmo identificador de operação
  (EVENT-ID).

- **Campo Obrigatório \"Como\":** A Evidência deve registrar o Canal de
  origem (Caixa, ATM, App, Web, Terminal). Nota: Este campo é o mesmo
  Canal informado na Transação, carregado para o registro de Evidência.

- **Política de Retenção:** Evidência de Movimento (5 anos), Evidência
  de Acesso (2 anos), Evidência de Cadastro (conforme legislação).

- **Regra de Acesso (LGPD):** Consulta de Evidência por CPF + intervalo
  de datas é restrita a funcionários autorizados do banco (Operador,
  Auditor, Compliance). O Cliente não acessa diretamente.

- **Rastro de Consulta:** Toda consulta de Evidência gera uma nova
  Evidência de Acesso. O ato de consultar também é auditado.

Pendências de Modelagem

*(Território que pertence ao domínio Banco, mas que ainda não foi
explorado. O farol ainda não chegou aqui.)*

- Tarifa, Juros, Multa, IOF

- Ocorrência

- Conciliação

- Estorno (automático e manual)

- Nota retida

- Depósito não registrado

- Valor a identificar

- Prazos de guarda (30 dias, 90 dias, 5 anos)

- Transferência agendada

- Transferência recorrente

- Cancelamento de transferência

- Detalhamento do fluxo de retorno de transferência externa

Twilight Zone

*(Domínios externos que tocam o Banco. Não são do Banco, mas o Banco
interage com eles e obedece suas regras. Dúvida de fronteira.)*

- Receita Federal (tributário)

- Auditoria Externa (controle)

- Banco Central (regulatório)

- FEBRABAN (padronização e rede)

- Outros bancos (rede bancária)

- Open Finance (canal externo de acesso)

Resumo do Domínio

Conceito: Conta\
Atores: Cliente, Operador, Sistema automático\
Manipulações: Abrir, Depositar, Sacar, Transferir, Consultar, Encerrar\
Evidências: Quem, Quando, Por quê, Como (Movimento, Acesso, Cadastro)\
Pendências de Modelagem: Tarifa, Juros, Multa, IOF, Ocorrência,
Conciliação, etc.\
Twilight Zone: Receita Federal, Auditoria, Banco Central, FEBRABAN,
Outros Bancos, Open Finance.

Evolução do Documento

v0.1-draft

Modelagem inicial. Conceito central: Conta. Seis manipulações.
Evidências definidas. Twilight Zone unificada.

v0.2-draft

- Separação de conceitos: O que antes era tudo \"Twilight Zone\" foi
  separado em \"Pendências de Modelagem\" e \"Twilight Zone\".

- **Detalhes do Domínio:** Adicionada a seção com os atributos, regras e
  estrutura de evidência.

- **Transferência Externa:** Corrigida a regra. Sai primeiro, e se
  rejeitada, volta (retorno).

- **Estrutura da Evidência:** Adicionada a distinção de tipos, EVENT-ID,
  política de retenção, LGPD.

- **Unificação da lista de Canais:** Padronizado para Caixa, ATM, App,
  Web, Terminal.

v0.3-draft

**O que mudou:**

- **Atributos da Transação:** Adicionados \"Tipo de Transação\" e
  \"Histórico\".

- **Tabelas de Domínio:** Criadas as tabelas fixas de Canais e Tipos de
  Transação para garantir a paridade dos dados.

- **Regra de Paridade:** O Histórico não é digitado. Ele é gerado pela
  concatenação obrigatória (Tipo + Canal).

**Motivo:** A v0.2 permitia que descrições divergentes fossem digitadas,
quebrando a paridade e a integridade do extrato. A v0.3 garante que o
dado nasça padronizado.
