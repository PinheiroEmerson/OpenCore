Domínio: Locadora

v0.2-draft

Status

DRAFT

Referência

Este documento aplica o OpenCore Manifesto v0.3-draft.

- Manifesto: define o permanente (Conceitos + Manipulações).

- Instanciação: define a fronteira deste domínio.

- Modelagem: descreve Conceitos e Manipulações dentro da fronteira.

Instanciação

Tipo

Locadora de veículos, mínimo, com operações essenciais.

O que entra

- Reservar veículo

- Retirar veículo

- Devolver veículo

- Consultar disponibilidade

- Cancelar reserva

O que não entra (por enquanto)

- Multas de trânsito

- Seguros

- Manutenção

- Combustível

- Sinistros

- Tarifas complexas

Atores

- Cliente (locatário)

- Atendente

- Sistema automático

Vistoriador é um papel do Atendente. Não é ator separado por enquanto.

Motivo do recorte

Iniciar o teste do manifesto em domínio diferente do Banco.

Validar universalidade. Crescimento por adição. Se falhar, falha
pequeno.

Fronteira declarada

Qualquer coisa fora da lista \"O que entra\" pertence a outro domínio ou
a uma futura expansão deliberada.

Mudar fronteira é decisão deliberada. Crescer dentro da fronteira é
adição natural.

Modelagem Conceitual

Convenção do Domínio

Toda Manipulação deve ser expressa como ação sobre um Conceito nomeado.

Conceito

Veículo

Conceito central do domínio Locadora. Único Conceito identificado até o
momento.

Veículo é o substrato onde as movimentações acontecem. Toda Manipulação
age sobre Veículo.

Veículo não tem dono, não tem proprietário. Tem Evidência de quem se
relaciona com ele.

Atores

Atores não são Conceitos. São quem age no domínio. Já declarados na
Instanciação.

- Cliente (locatário)

- Atendente

- Sistema automático

Manipulações

Toda Manipulação é ação sobre Veículo.

Reservar

Age sobre: Veículo

Retirar

Age sobre: Veículo

Devolver

Age sobre: Veículo

Consultar

Age sobre: Veículo

Cancelar

Age sobre: Veículo

Nota: Cancelar pode, no futuro, agir sobre Reserva (se Reserva virar
Conceito). Por enquanto, age sobre Veículo --- torna o Veículo
disponível de novo.

Evidências

Toda Manipulação produz Transição. Toda Transição deixa Evidência.

Evidência mínima: Quem, Quando, Por quê, Como.

Contrato

Contrato é Evidência. É o registro do acordo entre Locadora e Cliente.
Não é Conceito, não é Manipulação.

Reserva

Reserva é Evidência. É o registro de que um Veículo foi reservado. Não é
Conceito, não é Manipulação.

Vistoria

Vistoria é Evidência. É o registro do estado do Veículo na Retirada e na
Devolução. Não é Conceito.

Quilometragem, Placa, Modelo, Valor da diária

São atributos de Veículo. Não são Conceitos, não são Evidências
autônomas.

Detalhes do Domínio

*(A preencher. Esta seção é o resultado da conversa com o dono do
negócio. Aqui ficam os atributos, as regras de negócio e a estrutura de
evidência necessários para a Verbalização.)*

Pendências de Modelagem

*(Território que pertence ao domínio Locadora, mas que ainda não foi
explorado. O farol ainda não chegou aqui.)*

- Multas de trânsito

- Seguros

- Manutenção

- Combustível

- Sinistros

- Tarifas complexas

- Reserva como Conceito (se aparecer evidência)

Twilight Zone

*(Domínios externos que tocam a Locadora. Não são da Locadora, mas a
Locadora interage com eles.)*

- Detran (licenciamento e multas)

- Seguradoras (sinistros)

- Oficinas credenciadas (manutenção)

- Outras locadoras (rede)

Resumo do Domínio

Conceito: Veículo\
Atores: Cliente (locatário), Atendente, Sistema automático\
Manipulações: Reservar, Retirar, Devolver, Consultar, Cancelar\
Evidências: Quem, Quando, Por quê, Como (Contrato, Reserva, Vistoria)\
Pendências de Modelagem: Multas, Seguros, Manutenção, etc.\
Twilight Zone: Detran, Seguradoras, Oficinas, Outras locadoras.

Evolução do Documento

v0.1-draft

Modelagem inicial. Conceito central: Veículo. Cinco manipulações.
Evidências definidas. Twilight Zone unificada.

v0.2-draft

**O que mudou:**

- **Separação de conceitos:** O que antes era tudo \"Twilight Zone\" foi
  separado em \"Pendências de Modelagem\" e \"Twilight Zone\".

- **Detalhes do Domínio:** Adicionada a seção (em branco) para receber
  os atributos e regras.

- **Motivo:** Alinhamento com a estrutura do Domínio Banco v0.3,
  garantindo consistência no acervo.
