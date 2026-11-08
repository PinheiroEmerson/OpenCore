# Padrão de Verbalização COBOL

## v0.6-draft

---

## Status

DRAFT

---

## Escopo

Este documento define as regras de como o domínio será traduzido para a linguagem COBOL (Verbalização). Estas regras garantem padronização, legibilidade e crescimento por adição. O objetivo é evitar a duplicidade de código e garantir que a manutenção seja simples.

---

## 1. Nomeação e Arquitetura (Orquestrador + Subprogramas)

A Manipulação definida no Domínio é o ponto de entrada único. Ela não é um programa monolítico.

O Programa Principal (Orquestrador) deve ter o nome exatamente igual ao da Manipulação (ex: CONSULTA-SALDO, DEPOSITAR).

Os Subprogramas devem começar com o prefixo SUB- (ex: SUB-BUSCA-CPF). Eles contêm a lógica específica de busca ou validação.

Regra de Ouro da Arquitetura: Os subprogramas NUNCA devem ser chamados diretamente por sistemas externos ou telas. Eles só podem ser chamados pelo Orquestrador da Manipulação.

---

## 2. Padrão de Variáveis (Prefixos)

Para que qualquer coboleiro abra o código e entenda o que é cada coisa, usamos prefixos rígidos:

WS- (Working Storage): Variáveis internas de trabalho, que só existem durante a execução daquele programa.

LK- (Linkage): Parâmetros de entrada e saída em subprogramas (a ponte de comunicação).

IN- (Input): Dados que vêm de fora do programa (tela, arquivo, chamada externa).

OUT- (Output): Dados que são devolvidos para fora.

EVI- (Evidência): Todos os campos que compõem o registro de Evidência.

---

## 3. Controle de Fluxo e Flags (88-levels)

Proibido valor mágico: Nunca use IF WS-STATUS = 'A'. O código fica obscuro.

Uso obrigatório de 88-levels: O COBOL tem um recurso nativo para dar nomes aos valores. Use sempre.

   05 WS-STATUS PIC X(01).
      88 WS-ATIVO    VALUE 'A'.
      88 WS-ENCERRADO VALUE 'E'.
   *> Uso correto no código: IF WS-ATIVO

---

## 4. Uso de Copybooks

Copybook de Interface: Obrigatório para comunicação entre o Orquestrador e os Subprogramas. Garante que todos falem a mesma língua (ex: INTERFACE-CONSULTA-SALDO.cpy).

Copybook de Arquivo (FD): Obrigatório para a estrutura dos arquivos físicos (Conta, Evidência).

Regra de Ouro: Se o registro é usado por mais de um programa, vira Copybook. Se é usado só dentro de um programa, fica no WORKING-STORAGE dele. Não crie copybooks desnecessários.

---

## 5. Códigos de Retorno

Todo programa e subprograma deve retornar um código padrão. Proibido inventar códigos novos.

00 = Sucesso (operação concluída).

01 = Não Encontrado (ex: conta ou CPF não existe).

02 = Erro de Negócio (ex: saldo insuficiente, conta encerrada). A mensagem descritiva deve explicar o erro.

03 = Erro Técnico (ex: arquivo corrompido, falha de I/O).

---

## 6. A Evidência no COBOL (O EVENT-ID)

A Evidência é o rastro do sistema (Auditoria e LGPD). Ela é Append-Only (só adiciona, nunca altera). Toda Manipulação (seja de alteração ou de simples consulta) DEVE registrar a Evidência correspondente.

Formato do EVENT-ID: Data (8) + Hora (6) + Canal (2) + Sequencial Diário (8) = 24 caracteres.

Exemplo: 20261023 + 143200 + 01 + 00000001 = 202610231432000100000001

Tabela de Canais:

01 = Caixa
02 = ATM
03 = App
04 = Web
05 = Terminal

Arquivo de Evidência: Único para o sistema. O tipo de evidência é controlado pelo campo EVI-TIPO (01-Movimento, 02-Acesso, 03-Cadastro).

---

## 7. Estrutura de Dados (Layout da Evidência)

O Copybook de Evidência (EVIDENCIA.cpy) deve seguir este layout básico para garantir que a Verbalização seja padronizada:

   01 REG-EVIDENCIA.
      05 EVI-EVENT-ID     PIC X(24).
      05 EVI-TIPO         PIC 9(02).
         88 EVI-MOVIMENTO VALUE 01.
         88 EVI-ACESSO    VALUE 02.
         88 EVI-CADASTRO  VALUE 03.
      05 EVI-QUEM         PIC X(30).
      05 EVI-QUANDO.
         10 EVI-DATA      PIC 9(08).
         10 EVI-HORA      PIC 9(06).
      05 EVI-PORQUE       PIC X(50).
      05 EVI-COMO         PIC X(30).
      05 EVI-DETALHE      PIC X(100).

---

## 8. Regra da Paridade (Tabelas e Históricos)

Para garantir que o Domínio não vire bangu, o COBOL NÃO pode ter textos soltos no código. Tudo o que é descrição de negócio deve vir de uma Tabela de Domínio (lookup).

Regra do Histórico: O Histórico de uma Transação (ex: "Depósito - ATM") nunca é digitado pelo usuário. Ele é montado pelo programa usando um EVALUATE que busca as descrições oficiais (Tabela de Tipos + Tabela de Canais).

Exemplo de implementação no COBOL (Paridade):

   *> Montando o histórico padronizado
   EVALUATE WS-TIPO-TRANSACAO
       WHEN 01 MOVE "Depósito" TO WS-DESC-TIPO
       WHEN 02 MOVE "Saque" TO WS-DESC-TIPO
       WHEN 03 MOVE "Transferência" TO WS-DESC-TIPO
       WHEN 04 MOVE "Pagamento" TO WS-DESC-TIPO
   END-EVALUATE.

   EVALUATE WS-CANAL
       WHEN 01 MOVE "Caixa" TO WS-DESC-CANAL
       WHEN 02 MOVE "ATM" TO WS-DESC-CANAL
       WHEN 03 MOVE "App" TO WS-DESC-CANAL
       WHEN 04 MOVE "Web" TO WS-DESC-CANAL
       WHEN 05 MOVE "Terminal" TO WS-DESC-CANAL
   END-EVALUATE.

   STRING WS-DESC-TIPO DELIMITED BY SPACE
          " - " DELIMITED BY SIZE
          WS-DESC-CANAL DELIMITED BY SPACE
          INTO WS-HISTORICO
   END-STRING.

---

## 9. Centralização da Evidência (O Subprograma de Registro)

Nenhuma Manipulação (Orquestrador) grava no arquivo de Evidência diretamente. Toda gravação é centralizada no subprograma SUB-REGISTRA-EVIDENCIA.

Regra: Toda Manipulação DEVE chamar o SUB-REGISTRA-EVIDENCIA ao final da sua execução (seja sucesso ou erro), passando a Interface de Evidência preenchida.

Por quê: Evita duplicação de código, garante que nenhuma Manipulação esqueça de gravar, e centraliza a manutenção (se o layout da Evidência mudar, altera-se em um lugar só).

### Copybook de Interface da Evidência (INTERFACE-EVIDENCIA.cpy)

Este é o contrato entre os Orquestradores e o Subprograma de Registro.

   01 WS-INTERFACE-EVIDENCIA.
      05 IN-EVI-TIPO         PIC 9(02).
      05 IN-EVI-EVENT-ID     PIC X(24).
      05 IN-EVI-QUEM         PIC X(30).
      05 IN-EVI-QUANDO.
         10 IN-EVI-DATA      PIC 9(08).
         10 IN-EVI-HORA      PIC 9(06).
      05 IN-EVI-PORQUE       PIC X(50).
      05 IN-EVI-COMO         PIC X(30).
      05 IN-EVI-DETALHE      PIC X(100).
      05 OUT-EVI-RETORNO     PIC 9(02).
         88 EVI-REGISTRO-OK     VALUE 00.
         88 EVI-ERRO-TECNICO    VALUE 03.

### Fluxo no Orquestrador (Exemplo: DEPOSITAR.cbl)

1. Recebe os dados da tela (conta, valor, canal).
2. Valida as regras de negócio (saldo, status, limites).
3. Atualiza o Saldo e regrava a Conta.
4. Preenche a WS-INTERFACE-EVIDENCIA com os dados do depósito e o EVENT-ID.
5. Faz CALL "SUB-REGISTRA-EVIDENCIA" USING WS-INTERFACE-EVIDENCIA.
6. Verifica o retorno: se OUT-EVI-RETORNO for diferente de 00, dispara erro técnico (03).

### Regra de Ouro do SUB-REGISTRA-EVIDENCIA

O subprograma de registro é o único que abre o arquivo de Evidência em modo WRITE (Append-Only). Ele nunca altera registros existentes. Ele apenas adiciona um novo registro ao final.

---

## 10. Recursos Modernos Permitidos (GnuCOBOL 3.x)

Para não sofrer com COBOL dos anos 80 e garantir produtividade, os seguintes recursos do GnuCOBOL moderno são oficialmente aprovados para uso no projeto:

**Formato Livre (`>>SOURCE FORMAT FREE`):**
Obrigatório no topo de todo programa. Elimina a necessidade de contar colunas (Área A / Área B). A indentação passa a ser estética, não sintática. Facilita a leitura e evita erros bobos de compilação.

**`EVALUATE` no lugar de `IF` aninhado:**
Sempre que houver múltiplos casos (tipo de transação, canal, status), usar `EVALUATE`. Deixa o código mais limpo e legível do que uma cascata de `IF/ELSE`.

**Funções Intrínsecas (`FUNCTION`):**
Usar `FUNCTION CURRENT-DATE`, `FUNCTION TRIM`, `FUNCTION UPPER-CASE`/`LOWER-CASE` e demais funções nativas para manipulação de data, string e números. Evita código artesanal e garante portabilidade.

**`TYPEDEF` e `SAME AS`:**
Usar `TYPEDEF` para criar tipos padronizados (ex: `TIPO-NUM-CONTA` = `PIC 9(09)`) e `SAME AS` para reaproveitar a estrutura de uma variável existente. Evita inconsistência de tamanho de campos entre programas.

**`JSON GENERATE` (uso futuro):**
Disponível no GnuCOBOL 3.2. Pode ser usado quando o sistema precisar exportar dados para APIs ou Open Finance. Não usar `JSON PARSE` (não implementado no 3.2).

**SuperBOL Studio (VSCode):**
IDE recomendada para o desenvolvimento. Oferece debug passo a passo (GDB), cobertura de código, navegação e refatoração. O uso é opcional, mas recomendado para produtividade e aprendizado.

**`ON SIZE ERROR` (obrigatório em saldo):**
Todo `COMPUTE` que altera o saldo de uma Conta DEVE ter a cláusula `ON SIZE ERROR`. Se o resultado não couber no campo (ex: `PIC S9(11)V99`), a operação NÃO acontece e o programa retorna código 02 (Erro de Negócio). Isso evita que o saldo seja truncado silenciosamente ou que o programa aborte.

---

## 11. Recursos Proibidos

**`GO TO`:**
Proibido. O fluxo deve ser controlado com `PERFORM` (para chamada de rotinas) e `EVALUATE` (para decisão). O `GO TO` gera código espaguete, dificulta a manutenção e é a maior fonte de bugs em COBOL legado.

**Textos soltos no código:**
Proibido. Toda descrição de negócio (tipo de transação, canal, histórico) deve vir de Tabelas de Domínio (ver Regra 8). Nada de `MOVE "Depósito" TO WS-HISTORICO` fora de um `EVALUATE` de paridade.

**Variáveis sem prefixo:**
Proibido. Toda variável deve ter um dos prefixos definidos na Regra 2 (`WS-`, `LK-`, `IN-`, `OUT-`, `EVI-`).

**Recursos de debug de programador na Evidência:**
Proibido. A Evidência é de domínio, não de debug. Não usar `EXCEPTION-LOCATION-N` ou `DECLARATIVES` para preencher a Evidência com linha de código. O debug é feito no SuperBOL, não no log de auditoria.

---

## 12. Regra de Ouro (O Domínio é a Fonte)

Se o código precisa de uma função, regra ou variável que não está no Domínio (documento do Domínio Banco), pare. O código não pode criar regras de negócio do nada (gambiarra). Primeiro atualize o Domínio (Adição), depois atualize o código.

---

## Evolução do Documento

v0.1-draft: Criação do padrão inicial. Regra de evidência restrita a "programas que manipulam dados".

v0.2-draft: Correção na regra da Evidência (seção 6). Agora exige registro para toda Manipulação, incluindo consultas.

v0.3-draft: Adição da seção 8 (Regra da Paridade). Inclusão da obrigatoriedade de usar EVALUATE para montar o histórico, evitando textos soltos e divergentes no código.

v0.4-draft: Adição da seção 9 (Centralização da Evidência). Criação do subprograma SUB-REGISTRA-EVIDENCIA e do copybook INTERFACE-EVIDENCIA.cpy.

v0.5-draft: Adição das seções 10 (Recursos Modernos Permitidos) e 11 (Recursos Proibidos). Oficialização do uso de formato livre, EVALUATE, funções intrínsecas, TYPEDEF, JSON GENERATE e SuperBOL Studio.

v0.6-draft: Adição do ON SIZE ERROR como recurso moderno obrigatório na seção 10. Inclusão da proibição de recursos de debug de programador na Evidência (EXCEPTION-LOCATION-N, DECLARATIVES) na seção 11. Motivo: proteger o saldo contra estouro de campo (regra de negócio) e manter a Evidência limpa (sem lixo de debug).