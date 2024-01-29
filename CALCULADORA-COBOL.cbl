      *   *****************************************************************
      *    Author:    GERSON GALVEZ
      *    Date:      26/1/2024
      *    Purpose:   Calculadora basica en COBOL
      *   *****************************************************************
          IDENTIFICATION DIVISION.
          PROGRAM-ID. CALCULADORA-COBOL.
          DATA DIVISION.
          FILE SECTION.
          WORKING-STORAGE SECTION.

          01 NUM1       PIC 9(4).
          01 NUM2       PIC 9(4).
          01 RESULTADO  PIC 9(8).
          01 OPTYPE     PIC X(1).

          PROCEDURE DIVISION.
          MAIN-PROCEDURE.
          CALL "SYSTEM" USING "cmd.exe /c cls".
          PERFORM RUTINAINICIO.
          STOP RUN.

          RUTINAINICIO.
                DISPLAY "****************************"
                DISPLAY "* CALCULADORA BASICA COBOL *"
                DISPLAY "****************************"
                PERFORM RUTINTNUM1.

          RUTINTNUM1.
                DISPLAY "Introduce el primer numero:"
                ACCEPT NUM1.

                IF NUM1 NOT NUMERIC OR NUM1 = ZERO OR NUM1 > 9999
                  DISPLAY "Numero no valido."
                  PERFORM RUTINTNUM1
                ELSE
                  PERFORM RUTINTNUM2
                END-IF.

          RUTINTNUM2.
                DISPLAY "Introduce el segundo numero:"
                ACCEPT NUM2.

                IF NUM2 NOT NUMERIC OR NUM2 = ZERO OR NUM2 > 9999
                  DISPLAY "Numero no valido."
                  PERFORM RUTINTNUM2
                ELSE
                  PERFORM RUTINADATAINT
                END-IF.

          RUTINASUM.
                ADD NUM1 TO NUM2 GIVING RESULTADO.
                DISPLAY "RESULTADOS DE LA SUMA: " RESULTADO.

          RUTINASUB.
                SUBTRACT NUM1 FROM NUM2 GIVING RESULTADO.
                DISPLAY "RESULTADOS DE LA RESTA: " RESULTADO.

          RUTINAMUL.
                MULTIPLY NUM1 BY NUM2 GIVING RESULTADO.
                DISPLAY "RESULTADOS DE LA MULTIPLICACION: " RESULTADO.

          RUTINADIV.
                IF NUM2 = ZERO
                  DISPLAY "No se puede dividir por cero."
                ELSE
                  DIVIDE NUM1 BY NUM2 GIVING RESULTADO
                  DISPLAY "RESULTADOS DE LA DIVISION: " RESULTADO
                END-IF.

          RUTINADATAINT.
            DISPLAY "SUMA (S), RESTA (R), "
            "MULTIPLICACION (M), DIVISION (D)".
            DISPLAY "Pulsa una tecla para continuar...".
            ACCEPT OPTYPE.

            EVALUATE OPTYPE
                WHEN "S"
                WHEN "s"
                    PERFORM RUTINASUM
                WHEN "R"
                WHEN "r"
                    PERFORM RUTINASUB
                WHEN "M"
                WHEN "m"
                    PERFORM RUTINAMUL
                WHEN "D"
                WHEN "d"
                    PERFORM RUTINADIV
                WHEN OTHER
                  DISPLAY "La opcion seleccionada no es valida."
                  PERFORM RUTINADATAINT
          END-EVALUATE.

          END PROGRAM CALCULADORA-COBOL.
