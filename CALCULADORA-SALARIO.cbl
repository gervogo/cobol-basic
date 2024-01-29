      *   *****************************************************************
      *    Author:    GERSON GALVEZ
      *    Date:      29/1/2024
      *    Purpose:   Calculadora de salarios
      *   *****************************************************************
          IDENTIFICATION DIVISION.
          PROGRAM-ID. CALCULADORA-SALARIO.
          DATA DIVISION.

          WORKING-STORAGE SECTION.
          01    PRICE-PER-HOURS   PIC 9(2).


          01    SAL-BRUTO     PIC 9(4).
          01    DEDUCCIONES   PIC S9(4)V99.
          01    SAL-NETO      PIC 9(4).

          LINKAGE SECTION.
                01 EMPLOYEE-ID    PIC 9(2).
                01 EMPLOYEE-NAME  PIC X(10).
                01 WORK-HOURS     PIC 9(2).

          PROCEDURE DIVISION USING EMPLOYEE-ID EMPLOYEE-NAME WORK-HOURS.


                MOVE 30 TO PRICE-PER-HOURS.
                MULTIPLY PRICE-PER-HOURS BY WORK-HOURS GIVING SAL-BRUTO.

      *         Se le resta el 21% de deducciones
                MOVE 0.21 TO DEDUCCIONES.
                MULTIPLY DEDUCCIONES BY SAL-BRUTO GIVING SAL-NETO.
                SUBTRACT SAL-NETO FROM SAL-BRUTO GIVING SAL-NETO.


                DISPLAY "*****************************************"
                "*******************************"
                DISPLAY "* NOMBRE     * ID * HORAS * SALARIO BRUTO"
                " * DEDUCCIONES * SALARIO NETO *"
                DISPLAY "*****************************************"
                "*******************************"
                DISPLAY "* "EMPLOYEE-NAME
                " * "EMPLOYEE-ID
                " *   "WORK-HOURS
                "  * " SAL-BRUTO
                "          * " DEDUCCIONES
                "    * " SAL-NETO
                "         *"
                DISPLAY "*****************************************"
                "*******************************"

                STOP RUN.

          END PROGRAM CALCULADORA-SALARIO.
