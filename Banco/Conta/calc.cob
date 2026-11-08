       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALC.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NUM1        PIC 9(5)V99 VALUE 0.
       01 WS-NUM2        PIC 9(5)V99 VALUE 0.
       01 WS-RESULT      PIC 9(7)V99 VALUE 0.
       01 WS-OPCAO       PIC X VALUE SPACE.
       01 WS-MENSAGEM    PIC X(40) VALUE SPACES.
       PROCEDURE DIVISION.
           DISPLAY "Digite o primeiro numero: " WITH NO ADVANCING.
           ACCEPT WS-NUM1.
           DISPLAY "Digite o segundo numero: " WITH NO ADVANCING.
           ACCEPT WS-NUM2.
           DISPLAY "Escolha a operacao (A=Soma, S=Sub, M=Mult, D=Div): "
               WITH NO ADVANCING.
           ACCEPT WS-OPCAO.

           EVALUATE TRUE
               WHEN WS-OPCAO = "A" OR WS-OPCAO = "a"
                   COMPUTE WS-RESULT ROUNDED = WS-NUM1 + WS-NUM2
                   MOVE "Soma" TO WS-MENSAGEM
               WHEN WS-OPCAO = "S" OR WS-OPCAO = "s"
                   COMPUTE WS-RESULT ROUNDED = WS-NUM1 - WS-NUM2
                   MOVE "Subtracao" TO WS-MENSAGEM
               WHEN WS-OPCAO = "M" OR WS-OPCAO = "m"
                   COMPUTE WS-RESULT ROUNDED = WS-NUM1 * WS-NUM2
                   MOVE "Multiplicacao" TO WS-MENSAGEM
               WHEN WS-OPCAO = "D" OR WS-OPCAO = "d"
                   IF WS-NUM2 = 0
                       DISPLAY "Erro: divisao por zero!"
                       STOP RUN
                   END-IF
                   COMPUTE WS-RESULT ROUNDED = WS-NUM1 / WS-NUM2
                   MOVE "Divisao" TO WS-MENSAGEM
               WHEN OTHER
                   DISPLAY "Opcao invalida!"
                   STOP RUN
           END-EVALUATE.
           DISPLAY "--- Resultado ---"
           DISPLAY WS-MENSAGEM ": " WS-RESULT.
           STOP RUN.
           