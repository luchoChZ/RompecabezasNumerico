//revizar si existe el numero en la matriz

SubProceso revisaSiExiste(A Por Referencia,numAzar,Encontrado Por Referencia)
	Definir i,j Como Entero
	Para ii = 0 Hasta 3 Hacer //Hace un recorrido en la matriz llena para saber si hay numeros repetidos
		Para jj = 0 Hasta 3 Hacer 
			si(A[ii,jj]=numAzar)
				Encontrado = Verdadero
			FinSi
		FinPara
	FinPara
FinSubProceso

// Este proceso inicializa la matriz con numero positivos entre 0 y 15 y los acomoda al azar sin que se repitan
SubProceso NuevoJuego(A Por Referencia)
	Definir i,j,numAzar Como Entero
	Definir Encontrado Como Logico
	Encontrado = Falso
	Limpiar Pantalla
	Para i = 0 Hasta 3 Hacer
		Para j = 0 Hasta 3 Hacer
			numAzar = azar(15)+1
			revisaSiExiste(A,numAzar,Encontrado)
			si (Encontrado = Falso)
				A[i,j] = numAzar
				si(i=3)Y(j=2)
					j=3
					A[3,3]=0
				FinSi
			SiNo
				j=j-1	
				Encontrado = Falso
			FinSi	
		FinPara
	FinPara
FinSubProceso

// Llena una matriz ordenada y de 1 a 15 y en la ultima posición escribe un cero
SubProceso  LlenaMatrizOrdenada(mat Por Referencia)
	definir i,j, cont Como Entero
	con=0
	para i = 0 hasta 3 Hacer
		para j = 0 hasta 3 Hacer
			cont=cont+1
			mat[i,j]=cont
		FinPara
	FinPara
	mat[3,3]=0
FinSubProceso
//Esta función revisa si el usuario gana la partida
Funcion gano <- revisaSiGano(ma Por Referencia,maOrdenada Por Referencia)
	Definir iguales Como Logico
	iguales=Verdadero
	Definir i,j Como Entero
	para i = 0 hasta 3 Hacer
		para j= 0 hasta 3 Hacer
			si ma[i,j]<>maOrdenada[i,j] entonces
				iguales=Falso	
			FinSi
		FinPara
	FinPara
	si iguales=Verdadero Entonces
		gano=Verdadero
	SiNo
		gano=falso
	FinSi
FinFuncion

// Este procedimiento revisa cuales son las jugadas posibles dependiando del espacion en blanco en la matriz
SubProceso  movimientosPosibles(ma Por Referencia, arriba Por Referencia,abajo Por Referencia,derecha Por Referencia,izquierda Por Referencia,fila Por Referencia,col Por Referencia)
	para i=0 hasta 3 Hacer
		para j=0 hasta 3 Hacer
			si (ma[i,j]=0)
				Fila=i
				col=j
				SI (Fila=0)
					abajo=falso
				FinSi
				SI (Fila=3)
					arriba=falso
				FinSi
				SI (col=0)
					derecha=falso
				FinSi
				SI (col=3)
					izquierda=falso
				FinSi
			FinSi
		FinPara
	FinPara
FinSubProceso

//Procedimiento para realizar los movimientos en pantalla
SubProceso HacerMovimientos(ma Por Referencia, salgo Por Referencia, UstedGano Por Referencia, otroC Por Referencia, cont Por Valor contP Por Referencia )
	Definir i,j, fila, col, Fnueva, FnuevaArriba, CnuevaD, CnuevaIZ,matrizOrdenada Como Entero
	Dimension matrizOrdenada[4,4]
	Definir jugada Como Caracter
	Definir arriba, abajo, derecha, izquierda Como Logico
	arriba = Verdadero
	abajo = Verdadero
	derecha=Verdadero
	izquierda=Verdadero
	LlenaMatrizOrdenada(matrizOrdenada)//Llama al procedimeinto que genera la matris ordenada
	UstedGano=revisaSiGano(ma,matrizOrdenada)// llama a la funcion que reviza si el usuario gana, y trae un valor lógico verdadero o falso 
	MuestraCambio(ma, fila, col, cont, contP)// Vuelve a mostrar la función despues de que el usuario hace un movimiento
	movimientosPosibles(ma,arriba,abajo,derecha,izquierda,fila,col)//Llama el procedimiento que revisa los movimientos disponibles
	escribir "             ******************************************************"
	Escribir ""
	Escribir "                                            [W]"
	Escribir "                                     [A]            [D]"
	Escribir "                                            [S]"
	Escribir ""
	Escribir ""
	Escribir "             *              Movimientos Posibles                  *"
	si (abajo=Verdadero) y (fila <> 0) 
		Fnueva=fila-1 
		Escribir "             Mover ", ma[Fnueva,col], " con tecla S "
	FinSi
	si (arriba=Verdadero)
		FnuevaArriba=fila+1
		Escribir "             Mover ", ma[FnuevaArriba,col], " con tecla W "
	FinSi	
	si (derecha=Verdadero)  y (col <> 0)
		CnuevaD=col-1
		Escribir "             Mover ", ma[fila,CnuevaD], " con tecla D "
	FinSi
	si (izquierda=Verdadero)
		CnuevaIZ=col+1
		Escribir "             Mover ", ma[fila,CnuevaIZ], " con tecla A"
	FinSi
	si UstedGano = Falso Entonces
		leer jugada	
	FinSi
	jugada=Mayusculas(jugada)
	si(jugada="S")
		ma[fila,col]=ma[Fnueva,col]
		ma[Fnueva,col]=0
	FinSi	
	si(jugada="W") y (arriba=Verdadero)
		ma[fila,col]=ma[FnuevaArriba,col]
		ma[FnuevaArriba,col]=0
	FinSi	
	si(jugada="D")
		ma[fila,col]=ma[fila,CnuevaD]
		ma[fila,CnuevaD]=0
	FinSi
	si(jugada="A") y izquierda = Verdadero
		ma[fila,col]=ma[fila,CnuevaIZ]
		ma[fila,CnuevaIZ]=0
	FinSi
	si(jugada="X") O UstedGano = Verdadero
		salgo=Verdadero
	FinSi	
	si(jugada="N")
		otroC=Verdadero	
	FinSi
FinSubProceso


// Este procesimiento muestra en pantalla las actualizaciones de la matriz en pantalla
SubProceso MuestraCambio(m Por Referencia, fila, col,cont, contP)
	Limpiar Pantalla
	Definir i,j Como Entero
	escribir "            ******************************************************"
	Escribir "            *               Debe ordenar los números             *"
	escribir "            ******************************************************"
	Escribir ""
	para i=0 hasta 3 Hacer
		para j=0 hasta 3 Hacer
			si m[i,j] <> 0
				si m[i,j]>9
					escribir Sin Saltar "             ", m[i,j] , "  "
				SiNo
					escribir Sin Saltar "             0", m[i,j] , "  "
				FinSi
			Sino
				escribir Sin Saltar "             ", "  " , "  "
			FinSi
		FinPara
		escribir ""
		escribir " "
	FinPara
	escribir "             ******************************************************"
	escribir "             *   Presione X para Salir                            *"
	escribir "             *   Presione N para nuevo juego                      *"
	escribir "             *                                                    *"
	escribir "             *   Movimientos Hechos =   ",   cont-1, " y ",contP, "     Partidas        *"
FinSubProceso

// Inicializar la matriz en 0
SubProceso vaciarmatriz(m Por Referencia)
	Definir i,j Como Entero
	para i=0 hasta 3 Hacer
		para j=0 hasta 3 Hacer
			m[i,j]=0
		FinPara
	FinPara	
FinSubProceso

//Cuando el Usuario Termina o no desea jugar mas
SubProceso terminar(ganar)
	Definir salida Como Caracter
	Limpiar Pantalla
	si ganar = Verdadero
		salida= "             *          Felicidades ganó la partida       *"
	Sino
		salida= "             *          Gracias por usar el Juego         *"
	Finsi	
	escribir "             **********************************************"
	escribir "             *                                            *"
	escribir "             *                                            *"
	escribir "             *                                            *"
	escribir "             *                                            *"
	escribir "             *                                            *"
	escribir "             *                                            *"
	escribir "             *                                            *"
	escribir salida
	escribir "             *                                            *"
	escribir "             *                                            *"
	escribir "             *                                            *"
	escribir "             *                                            *"
	escribir "             *                                            *"
	escribir "             *                                            *"
	escribir "             **********************************************"
FinSubProceso

//Procedimiento principal
Algoritmo RompecabezasNumerico
	Definir i, matriz, este, contadorN,contadorP Como Entero
	Dimension matriz[4,4]
	Definir Salir, ganar, OtroCarton Como Logico
	Salir = Falso
	ganar = Falso
	OtroCarton = Falso
	contadorN=0
	contadorP=0
	NuevoJuego(matriz)	
	Mientras Salir = Falso Hacer
		contadorN=contadorN+1
		HacerMovimientos(matriz, Salir, ganar,OtroCarton,contadorN,contadorP)
		si OtroCarton = Verdadero
			contadorP=contadorP+1
			OtroCarton=Falso
			contadorN=0
			vaciarmatriz(matriz)
			NuevoJuego(matriz)
		FinSi
		terminar(ganar)
	FinMientras
FinAlgoritmo