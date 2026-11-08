IDENTIFICATION DIVISION.
PROGRAM-ID. CONTA.
AUTHOR. PinheiroEmerson.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
SPECIAL-NAMES.
    DECIMAL-POINT IS COMMA.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-SALDO       PIC 9(7)V99 VALUE ZERO.
01 WS-VALOR       PIC 9(7)V99 VALUE ZERO.
01 WS-OPCAO       PIC 9       VALUE ZERO.
01 WS-SALDO-EXIB  PIC Z.ZZZ.ZZ9,99.

PROCEDURE DIVISION.
    PERFORM UNTIL WS-OPCAO = 9
        DISPLAY " "
        DISPLAY "===== BANCO COBOL ====="
        DISPLAY "1 - Consultar saldo"
        DISPLAY "2 - Depositar"
        DISPLAY "3 - Sacar"
        DISPLAY "9 - Sair"
        DISPLAY "Opcao: " WITH NO ADVANCING
        ACCEPT WS-OPCAO
        EVALUATE WS-OPCAO
            WHEN 1
                PERFORM EXIBIR-SALDO
            WHEN 2
                PERFORM DEPOSITAR
            WHEN 3
                PERFORM SACAR
            WHEN 9
                DISPLAY "Encerrando..."
            WHEN OTHER
                DISPLAY "Opcao invalida!"
        END-EVALUATE
    END-PERFORM
    STOP RUN.

EXIBIR-SALDO.
    MOVE WS-SALDO TO WS-SALDO-EXIB
    DISPLAY "Saldo atual: R$ " WS-SALDO-EXIB.

DEPOSITAR.
    DISPLAY "Valor do deposito: " WITH NO ADVANCING
    ACCEPT WS-VALOR
    IF WS-VALOR > ZERO
        ADD WS-VALOR TO WS-SALDO
        DISPLAY "Deposito realizado."
    ELSE
        DISPLAY "Valor invalido."
    END-IF
    PERFORM EXIBIR-SALDO.

SACAR.
    DISPLAY "Valor do saque: " WITH NO ADVANCING
    ACCEPT WS-VALOR
    IF WS-VALOR > ZERO
        IF WS-VALOR <= WS-SALDO
            SUBTRACT WS-VALOR FROM WS-SALDO
            DISPLAY "Saque realizado."
        ELSE
            DISPLAY "Saldo insuficiente."
        END-IF
    ELSE
        DISPLAY "Valor invalido."
    END-IF
    PERFORM EXIBIR-SALDO.
