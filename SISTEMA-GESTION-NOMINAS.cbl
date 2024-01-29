      *   *****************************************************************
      *    Author:    GERSON GALVEZ
      *    Date:      26/1/2024
      *    Purpose:   Sistema de gestion de nominas
      *   *****************************************************************
          IDENTIFICATION DIVISION.
          PROGRAM-ID. SISTEMA-GESTION-NOMINAS.
          DATA DIVISION.
          FILE SECTION.
          WORKING-STORAGE SECTION.

      *         DATOS DEL USUARIO
          01 EMPLOYEE-NAME  PIC X(10).
          01 EMPLOYEE-ID    PIC 9(2).

          01 WORK-H PIC 9(2).


          PROCEDURE DIVISION.
          MAIN-PROCEDURE.
                PERFORM RUT-HEADER.

      *        CABECERA DEL PROGRAMA
          RUT-HEADER.
                DISPLAY "*********************************"
                DISPLAY "* SISTEMA DE GESTION DE NOMINAS *"
                DISPLAY "*********************************"
                PERFORM RUT-INS-ID.

      *         BUSCAR NOMBRE POR ID
          RUT-INS-ID.
                DISPLAY "Introduce un ID de empleado (1-9): ".
                ACCEPT EMPLOYEE-ID.

                EVALUATE EMPLOYEE-ID
                   WHEN 1
                      MOVE "Ana" TO EMPLOYEE-NAME
                   WHEN 2
                      MOVE "Luis" TO EMPLOYEE-NAME
                   WHEN 3
                      MOVE "Carla" TO EMPLOYEE-NAME
                   WHEN 4
                      MOVE "Juan" TO EMPLOYEE-NAME
                   WHEN 5
                      MOVE "Rosa" TO EMPLOYEE-NAME
                   WHEN 6
                      MOVE "Mario" TO EMPLOYEE-NAME
                   WHEN 7
                      MOVE "Elena" TO EMPLOYEE-NAME
                   WHEN 8
                      MOVE "Pablo" TO EMPLOYEE-NAME
                   WHEN 9
                      MOVE "Gerson" TO EMPLOYEE-NAME
                   WHEN OTHER
                      DISPLAY "ERROR: Numero de usuario no valido"
                      PERFORM RUT-INS-ID
                END-EVALUATE
                PERFORM RUT-INS-WORK-H.


      *         INSERTAR WORK-H TRABAJADAS
          RUT-INS-WORK-H.
                DISPLAY "Introduce horas trabajadas: "
                ACCEPT WORK-H.

                IF WORK-H NOT NUMERIC OR WORK-H = ZERO OR WORK-H > 40
                  DISPLAY "ERROR: El empleado " EMPLOYEE-NAME
                  " solo puede trabajar de 1 a 40 horas."
                  PERFORM RUT-INS-WORK-H
                ELSE
                  PERFORM RUT-OPEN.

      *         LLAMAR A OTRO PROGRAMA PASANDO ID, NOMBRE Y WORK-H
          RUT-OPEN.
                DISPLAY "ABRIENDO CALCULADORA DE SALARIO..."
                DISPLAY " "
                CALL "CALCULADORA-SALARIO" USING
                EMPLOYEE-ID EMPLOYEE-NAME WORK-H.

          STOP RUN.

          END PROGRAM SISTEMA-GESTION-NOMINAS.
