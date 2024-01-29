          IDENTIFICATION DIVISION.
          PROGRAM-ID. SISTEMA-GESTION-NOMINAS.
      * ************************************************
      *      Author:    GERSON GALVEZ                  *
      *      Date:      26/1/2024                      *
      *      Purpose:   Sistema de gestion de nominas  *
      * ************************************************
           DATA DIVISION.
           FILE SECTION.
           WORKING-STORAGE SECTION.

      *         DATOS DEL USUARIO
          01 EMPLOYEE-NAME  PIC X(10).
          01 EMPLOYEE-ID    PIC 9(2).
          01 WORK-H PIC 9(2).
          01 OPCION-REPETIR PIC X.

          01 RESTART PIC X(1).

          PROCEDURE DIVISION.
          MAIN-PROCEDURE.


      *         CABECERA DEL PROGRAMA
          Persona-HEADER.
               DISPLAY
               "*****************************"
               "*****************************"
               DISPLAY
               "* SISTEMA DE GESTION DE NOMINAS"
               " PARA EMPLEADOS POR HORAS *"
               DISPLAY
               "*****************************"
               "*****************************" X"0A".


      *         BUSCAR NOMBRE POR ID
          Persona-INS-ID.
                DISPLAY "Introduce un ID de empleado (1-9): ".
                ACCEPT EMPLOYEE-ID.

                EVALUATE EMPLOYEE-ID
                 WHEN 1
                   MOVE "Ana" TO EMPLOYEE-NAME
                  WHEN 2
                   MOVE "Pedro" TO EMPLOYEE-NAME
                 WHEN 3
                   MOVE "Juan" TO EMPLOYEE-NAME
                 WHEN 4
                   MOVE "Luis" TO EMPLOYEE-NAME
                 WHEN 5
                   MOVE "Maria" TO EMPLOYEE-NAME
                 WHEN 6
                   MOVE "Sofia" TO EMPLOYEE-NAME
                 WHEN 7
                   MOVE "Carlos" TO EMPLOYEE-NAME
                 WHEN 8
                   MOVE "Lucia" TO EMPLOYEE-NAME
                 WHEN 9
                   MOVE "Gerson" TO EMPLOYEE-NAME
                 WHEN OTHER
                   DISPLAY "ERROR: Numero de usuario no valido"
                   PERFORM Persona-INS-ID
          END-EVALUATE

                PERFORM Persona-INS-WORK-H.

      *         INSERTAR WORK-H TRABAJADAS
          Persona-INS-WORK-H.
                DISPLAY X"0A" "El empleado con ID " EMPLOYEE-ID
                " se llama " EMPLOYEE-NAME X"0A"
                DISPLAY "Introduce horas trabajadas: "
                ACCEPT WORK-H.

                IF WORK-H NOT NUMERIC OR WORK-H = ZERO OR WORK-H > 40
                   DISPLAY "ERROR: sólo se puede trabajar de "
                   "1 a 40 horas."
                   PERFORM Persona-INS-WORK-H
                ELSE
                   PERFORM Persona-OPEN.

      *         LLAMAR A OTRO PROGRAMA PASANDO ID, NOMBRE Y WORK-H
          Persona-OPEN.
                CALL "SYSTEM" USING "cmd.exe /c cls".
                CALL "CALCULADORA-SALARIO"
                   USING  EMPLOYEE-ID
                           EMPLOYEE-NAME
                           WORK-H.
                   PERFORM Repetir-calculo.

          Repetir-calculo.
                DISPLAY X"0A""¿Desea realizar otro calculo? (S/N)"
                   ACCEPT OPCION-REPETIR

                   EVALUATE OPCION-REPETIR
                    WHEN "S"
                    WHEN "s"
                       CALL "SYSTEM" USING "cmd.exe /c cls"
                       GO TO MAIN-PROCEDURE
                   WHEN "N"
                   WHEN "n"
                      CALL "SYSTEM" USING "cmd.exe /c cls"
                      DISPLAY "Saliendo del programa..." X"0A"

                      STOP RUN

                   WHEN OTHER
                      CALL "SYSTEM" USING "cmd.exe /c cls"
                      DISPLAY "ERROR: Entrada no valida."X"0A"
                      GO TO Repetir-calculo.


          END PROGRAM SISTEMA-GESTION-NOMINAS.
