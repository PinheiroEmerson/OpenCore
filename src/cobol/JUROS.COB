       IDENTIFICATION DIVISION.
       PROGRAM-ID. JUROS.
       AUTHOR. ALVUS DUMBLE.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-ENTRADA.
           05  WS-CAPITAL        PIC 9(9)V99.
           05  WS-TAXA           PIC 9(3)V99.
           05  WS-PERIODO        PIC 9(3).
       01  WS-RESULTADO.
           05  WS-JUROS          PIC 9(9)V99.
           05  WS-TOTAL          PIC 9(9)V99.
       01  WS-CONTADOR           PIC 9(3).
       01  WS-EXIBE              PIC Z(8)9,99.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "CALCULADORA DE JUROS SIMPLES".
           DISPLAY "------------------------------".

           DISPLAY "Capital inicial (ex: 1000,00): ".
           ACCEPT WS-CAPITAL.

           DISPLAY "Taxa de juros mensal (%) (ex: 1,50): ".
           ACCEPT WS-TAXA.

           DISPLAY "Periodo em meses (ex: 12): ".
           ACCEPT WS-PERIODO.

           COMPUTE WS-JUROS = WS-CAPITAL * (WS-TAXA / 100) * WS-PERIODO.
           COMPUTE WS-TOTAL = WS-CAPITAL + WS-JUROS.

           MOVE WS-JUROS TO WS-EXIBE.
           DISPLAY "Juros: R$ " WS-EXIBE.
           MOVE WS-TOTAL TO WS-EXIBE.
           DISPLAY "Total: R$ " WS-EXIBE.

           DISPLAY " ".
           DISPLAY "Evolucao mes a mes:".
           PERFORM VARYING WS-CONTADOR FROM 1 BY 1
               UNTIL WS-CONTADOR > WS-PERIODO
               COMPUTE WS-JUROS = WS-CAPITAL * (WS-TAXA / 100)
                   * WS-CONTADOR
               COMPUTE WS-TOTAL = WS-CAPITAL + WS-JUROS
               MOVE WS-TOTAL TO WS-EXIBE
               DISPLAY "Mes " WS-CONTADOR ": R$ " WS-EXIBE
           END-PERFORM.

           STOP RUN.
