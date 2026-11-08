       IDENTIFICATION DIVISION.
       PROGRAM-ID. MERGETESTE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  CLIENTE.
           05  CUST-ID       PIC 9(5)      VALUE 42.
           05  CUST-NAME     PIC X(20)     VALUE 'Ana Lopez'.
           05  BALANCE       PIC S9(5)V99  VALUE -12.50.
           05  ACTIVE-FLAG   PIC X(1)      VALUE 'Y'.

       01  JSON-OUT          PIC X(200).
       01  JSON-LEN          PIC 9(4)      VALUE 0.
       01  XML-OUT           PIC X(300).
       01  XML-LEN           PIC 9(4)      VALUE 0.

       PROCEDURE DIVISION.
           JSON GENERATE JSON-OUT FROM CLIENTE
               COUNT IN JSON-LEN
           END-JSON.

           XML GENERATE XML-OUT FROM CLIENTE
               COUNT IN XML-LEN
           END-XML.

           DISPLAY "=== JSON ==="
           DISPLAY JSON-OUT(1:JSON-LEN)
           DISPLAY "Tamanho JSON: " JSON-LEN
           DISPLAY " "
           DISPLAY "=== XML ==="
           DISPLAY XML-OUT(1:XML-LEN)
           DISPLAY "Tamanho XML: " XML-LEN
           STOP RUN.
