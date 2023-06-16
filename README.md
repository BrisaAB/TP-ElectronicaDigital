# TP-ElectronicaDigital
Código en Verilog para realizar un divisor de números enteros de cuatro bits mediante el uso de una FSM.
Este repositorio contiene el trabajo grupal final de la materia Electrónica Digital. 
Consigna:
Realice un divisor de números enteros de cuatro bits mediante el uso de una FSM (Finite State
Machine), compuesta por:
● Módulo de procesamiento de datos que permita al usuario cargar los valores del numerador,
denominador y obtener el resultado.
● Bloques combinacionales y/o secuenciales que procesan la información.
● FSM que realice la operación de división entera.
Para dividir dos números enteros de N bits, se propone el siguiente algoritmo:
1. Cargar los datos, en este caso numerador y denominador de la división.
2. Determinar si el denominador es distinto de cero. Si el denominador fuera igual a cero, la división
no sería posible. En este caso el proceso termina, pudiendo informar esta situación mediante
algún mensaje o señal de error. De lo contrario, es posible realizar la división.
3. Para obtener el resultado y el resto de la división, es posible restar al numerador una cantidad
igual al denominador, iterando sucesivamente hasta que el numerador sea menor al
denominador. Cuando esto sucede, el resultado es igual al número de iteraciones realizadas, y el
resto de la división es igual al valor del numerador tras la última iteración. Por ejemplo, para
hacer 5 dividido 2 el proceso es el siguiente, dando como resultado 2 y resto 1:
Iteración 1 5 - 2 = 3
Iteración 2 3 - 2 = 1
Realice la FSM junto con su diagrama de estados y transiciones. Este diagrama será el que describe
el comportamiento de la FSM. Con el diagrama de estados y transiciones, y las operaciones a realizar,
el paso final es determinar qué elementos de hardware (registros, flip-flops, contadores, memorias, etc.)
se requieren para llevar a cabo el algoritmo propuesto. Un diagrama en bloques puede resultar muy útil
en esta instancia, ya que ayuda a visualizar el hardware que se va a implementar, con sus respectivas
entradas, salidas y señales de control.
Implemente el diseño en verilog, compruebe su correcto funcionamiento mediante testbench y
finalmente impacte el diseño en la FPGA provista por la cátedra. Recuerde que las FPGA disponen de 4
LEDs que permitirán visualizar el numerador y el denominador en el momento de carga, así como el
resultado. Asimismo, posee cuatro botones para que el usuario determine la carga de los operandos, el
valor numérico de los mismos y la muestra de resultados.
