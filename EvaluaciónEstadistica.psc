SubProceso  Menudecalculos ( sNY, sN, sYi2 )
		//define variables
	Definir menu como entero;
	Definir M,Vy,Dy,CV  como real;
	//calculo del promedio
	M<-sNY/sN;
	//calculo de la varianza
	Vy<-(sYi2/sN)-(M^2);
	//calculo de la desviación estandar
	Dy<-rc(Vy);
	//calculo del coeficiente de variación
	CV<-(Dy/M)*100;
		Repetir
			//menu de opciones
			Escribir "MENÜ";
			Escribir "Marque 1 para calcular el promedio (Media aritmetica) ";
			Escribir "Marque 2 para calcular la Varianza";
			Escribir "Marque 3 para calcular la Desviación Estandar";
			Escribir "Marque 4 para calcular el Coeficiente de Variación";
			Escribir "Marque 5 para salir";
			Escribir "";
			//secuencia correspondiente a la opción del usuario	
			Leer menu;
			Segun menu Hacer
				1:
					Escribir "la Media aritmetica es: ",M;
				2:
					Escribir "la Varianza es: ",Vy;
				3:
					Escribir "la Desviación Estandar es: ",Dy;
				4:
					Escribir "el Coeficiente de Variación es: ",CV,"%";
					Escribir "";
					//evalua el resultado del coeficiente de variación
					Si CV<10 Entonces
						Escribir "Los datos son muy buenos, la muestra es muy homogenea.";
					SiNo
						Si CV >= 10 Y CV <20 Entonces
							Escribir "Los datos son buenos, la muestra es homogenea.";
						SiNo
							Si CV >= 30 Entonces
								Escribir "Los datos estan muy dispersos, la muestra es muy heterogenea.";
							SiNo
								Escribir "Los datos estan dispersos, la muestra es heterogenea.";
							FinSi
						FinSi
					FinSi
				5:
					Escribir "¡¡ MUCHAS GRACIAS !! ";					
				De Otro Modo:
					Escribir "Opción no válida";
			FinSegun
			Escribir "";
			Escribir "Presione enter para continuar";
			Esperar Tecla;
			limpiar pantalla;			
		Hasta Que menu == 5
		
FinSubProceso


Proceso Matriz
	//define variables
	Definir N,sN Como Entero;
	Definir  Yi,Yi2,sYi2,NY, sNY, I,H Como Real;
	//define los arreglos
	Dimension Yi[3];
	Dimension Yi2[3];
	Dimension N[3];
	Dimension NY[3];
	//inicializa contadores
	sNY<-0;
	sN<-0;
	sYi2<-0;
	H<-0;
	//instrucciones de uso
	Escribir "El siguiente programa analiza la estatura promedio de tres grupos de personas";
	Escribir ">>> Presione una tecla para continuar <<<";
	Esperar Tecla;
	Limpiar Pantalla;
	//toma valores para los arreglos y los acumula
	Para I<-0 Hasta 2 Con Paso 1 Hacer
	Limpiar Pantalla;
	Escribir "ingrese la estatura promedio del grupo ",I+1,": " ;
	Leer Yi[I];
	Escribir "¿cuantas personas del grupo ",I+1," tienen dicha estatura en promedio? ";
	Leer N[I];
	//carga el vector NY
	NY[I] <- Yi[I] * N[I];
	//carga el vector Yi2
	Yi2[I] <- Yi[I]^2 * N[I];
	//variables acumuladoras 
	sYi2<-sYi2+Yi2[I];
	sN<-sN+N[I];
	sNY<-sNY+NY[I];
FinPara
	Limpiar Pantalla;
	Escribir "TABLA DE VALORES:";
	//imprime los arreglos	
	Mientras H<3 Hacer
	Escribir "| Yi: ",Yi[H],"| FA: ",N[H],"| Yi*ni: ",NY[H],"|";
	H<-H+1;		
FinMientras
	//imprime los arreglos totales
	Escribir "TOTALES: ";
	Escribir "| TAMAÑO DE LA MUESTRA: ",sN,"| Yi*ni: ", sNY,"|";
	Escribir ""; 
	Escribir ">>> Presione una tecla para ver el menú de calculos <<<";
	Esperar Tecla;
	Limpiar Pantalla;
	Menudecalculos(sNY,sN, sYi2);
FinProceso
