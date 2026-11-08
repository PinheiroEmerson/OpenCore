# OpenCore — Por onde começar

Se você abriu esta pasta e não sabe em que ordem ler os arquivos, siga
esta sequência.

**1. LEIA PRIMEIRO: docs/manifesto/OpenCore-Manifesto-v0.3-draft.md**\
É o pilar. Define o que é permanente (Conceito + Manipulação) e o que é
transitório (tecnologia). Sem ele, o resto não faz sentido.

**2. DEPOIS: docs/cartilha/OpenCore-Cartilha-de-Uso-v0.5-draft.md**\
Ensina como aplicar o manifesto. Explica a ordem das camadas e o que
evitar.

**3. DEPOIS (opcional): docs/manifesto/OpenCore-Anexo-F-v0.3-draft.md**\
Mostra o manifesto em diagramas. Leia se você entende melhor
visualmente.

**4. EXEMPLO PRÁTICO: dominios/banco/docs/Dominio-Banco-v0.3-draft.md**\
Veja como o manifesto se aplica num domínio real. Aqui você encontra a
Instanciação, a Modelagem e os Detalhes do Domínio.

**5. QUANDO FOR CODAR:
docs/padroes/Padrao-de-Verbalizacao-COBOL-v0.6-draft.md**\
Regras de código. Só leia quando for escrever o sistema em COBOL. Define
arquitetura, padrões, paridade e evidência.

**6. PROVA DE UNIVERSALIDADE (opcional):
dominios/locadora/docs/Dominio-Locadora-v0.2-draft.md**\
Mostra que o método funciona em outro domínio. Serve para provar que o
manifesto não é só para banco.

**Regra de Ouro:** Se o código precisa de uma regra que não está no
Domínio, pare. Atualize o Domínio primeiro, depois o código.
