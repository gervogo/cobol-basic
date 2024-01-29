          IDENTIFICATION DIVISION.
          PROGRAM-ID. CALCULADORA-SALARIO.
      * ************************************************
      *      Author:    GERSON GALVEZ                  *
      *      Date:      29/1/2024                      *
      *      Purpose:   Calculadora de salarios        *
      * ************************************************
          DATA DIVISION.

          WORKING-STORAGE SECTION.

      *         Datos editables
           01 DATOS-EDITABLES.
                 02    TXT-HORAS  PIC X(18) VALUE "PRECIO POR HORAS: ".
                 02    PRICE-PER-HOURS   PIC 9(2) VALUE 50.
                 02    TXT-DEDUC  PIC X(20)
                                  VALUE "eur - % DEDUCCIONES:".
                 02    DEDUCCIONES-PERC   PIC 9V99 VALUE 0.21.

      *         Salarios calculados
          01    SAL-BRUTO     PIC 9(4) VALUE ZERO.
          01    SAL-NETO      PIC 9(4) VALUE ZEROS.
          01    DEDUCCIONES   PIC 9(4) VALUE ZEROES.

      *         Resultados para mostrar por pantalla
          01    TAB-HEADER    PIC X(100) VALUE SPACES.
          01    TAB-RESULT    PIC X(100) VALUE SPACES.

          LINKAGE SECTION.
                01 EMPLOYEE-ID    PIC 9(2).
                01 EMPLOYEE-NAME  PIC X(10).
                01 WORK-HOURS     PIC 9(2).

          PROCEDURE DIVISION USING
                 EMPLOYEE-ID
                 EMPLOYEE-NAME
                 WORK-HOURS.

      *          Calcula y almacena los resultados
           CALCULAR-SALARIOS.
                 COMPUTE SAL-BRUTO = PRICE-PER-HOURS * WORK-HOURS.
                 COMPUTE SAL-NETO =
                 (DEDUCCIONES-PERC * SAL-BRUTO) - SAL-BRUTO.

                 COMPUTE DEDUCCIONES = SAL-BRUTO - SAL-NETO.

      *          Almacena el String para salida en TAB-RESULT
                 STRING "* " EMPLOYEE-NAME
                        " * " EMPLOYEE-ID
                        " *   " WORK-HOURS
                        "  * " SAL-BRUTO
                        " eur      * -" DEDUCCIONES
                        " eur   * " SAL-NETO
                        " eur     *"
                        INTO TAB-RESULT.

      *          Línea separadora

      *          Línea separadora
           HEADER-LINE.
                 DISPLAY "***************************"
                         "***************************"
                         "******************".


      *          Imprime cabecera del documento
           DISP-HEADER.
                 DISPLAY  "*                         "
                          "NOMINA DEL EMPLEADO"
                          "                          *"
                 PERFORM HEADER-LINE.
                 DISPLAY "* NOMBRE     * ID * HORAS * "
                 "SALARIO BRUTO"
                 " * DEDUCCIONES * SALARIO NETO *"
                 PERFORM HEADER-LINE.


      *          Muestra los datos y la línea separadora
          DISPLAY-DATA.
             DISPLAY TAB-RESULT.
             PERFORM HEADER-LINE.
      *          Esto es solo por mostrar una variable compuesta
             DISPLAY " ".
             DISPLAY DATOS-EDITABLES.

          END PROGRAM CALCULADORA-SALARIO.
