
//funcion para establecer cuantas asiganturas , estudiantes y examenes hay 
Funcion decidir(n Por Referencia)

	Escribir "cuantos examamenes va a tener este semestre??:"   //(pero apra hacerlo mas corto solo pregutara por el nuemro de examenes)
	leer n
FinFuncion

//funcion para sacar un numero con dos decimales y Escribirlo por pantalla
funcion decimales2(num Por Referencia)
	
	num=trunc(num*100)/100
	
FinFuncion

///para agilizar la comprobacion voy a establecer cuales serán las asignaturas y los estudiantes 
Funcion rellenarAsig(asig por referencia )
	
	asig[0]="Programacion"  
	asig[1]="Lenguaje de Marcas"  
	asig[2]="Sistemas Infromaticos" 
	asig[3]="Base de Datos"  

FinFuncion

Funcion rellenarEstud(estud Por Referencia)
	
	estud[0]="Sara"
	estud[1]="Carlos"
	estud[2]="Pedro"
	
FinFuncion
///----------------------------------------------------------------------------------------------

//funcion para rellenar las notas de los estudiantes de cada asignatura
//(notas ,mediaAsignatura ,mediaEstudiante ,asiganturas ,estudiantes ,numAsinaturas ,numEstudiantes ,numNotas )
Funcion rellenarNotas(notas Por Referencia ,asig ,estud ,a ,e ,n)
	Definir i,j,k Como Entero
	
	Para i=0 Hasta a-1 hacer//recorre las asignaturas
		
		Escribir "---asignatura de ",asig[i],"----" 
		Escribir "---Notas---" 
		para j=0 hasta e-1 hacer//recorre los alumnos
			
			Escribir "--",estud[j]," : "
			Para k=0 hasta n-1 hacer//recorre las notas
				
				Repetir
					
					leer notas[i,j,k] //leo las notas
					
					si !(notas[i,j,k]>0 & notas[i,j,k]<10 ) Entonces
						Escribir "No esta dentro de los parametros(0 a 10)."
						Escribir Sin Saltar "introduzca la nota otra vez: "
					FinSi
					
				Hasta Que (notas[i,j,k]>0 & notas[i,j,k]<10 )
				
				decimales2(notas[i,j,k])
				
			FinPara
		FinPara
		Escribir ""
	FinPara
FinFuncion

//funcion que escribe por pantalla las botas y las medias
Funcion mostrarNotas(notas ,mA ,mE ,asig ,estud ,a ,e ,n)
	definir i ,j ,k Como Entero
	//(notas ,mediaAsignatura ,mediaEstudiante ,asiganturas ,estudiantes ,numAsinaturas ,numEstudiantes ,numNotas )
	
	Para i=0 Hasta a-1 hacer //recorre las asignaturas
		
		Escribir "      ","Notas de los alumnos de la asignatura de ",asig[i] 
		para j=0 hasta e-1 hacer  // recorre los estudiantes de la asignatura
			
			Escribir estud[j],": "
			para k=0 hasta n-1 Hacer// recorre las notas del estudiante
			Escribir (notas[i,j,k])  //escribe por pantalla las notas con dos decimales
			FinPara
			Escribir "---media de ",estud[j],": ",mE[i,j],"(redondeado: ",redon(mE[i,j]),")"//escribe por pantalla la media de las notas del estudiante
			
		FinPara
		Escribir "----------media de ",asig[i],": ",mA[i],"(redondeado: ",redon(mA[i]), ")","----"//escribe por pantalla la media de la asginatura
		Escribir ""
		
	FinPara
FinFuncion

//funcion para realizar la media de los estudiantes y de las asginaturas
Funcion media(notas Por Referencia,mA Por Referencia ,mE Por Referencia ,a ,e ,n)
	definir i ,j ,k Como Entero
	
	Para i=0 Hasta a-1 hacer//recorre las asignaturas
		mA[i]=0  //inicio cada media de las asignaturas a 0
		
		para j=0 hasta e-1 hacer//recorre los alumnos
			mE[i,j]=0 //inicio cada media de los estudiantes a 0
			
			Para k=0 hasta n-1 hacer//recorre las notas
				
				mE[i,j]=mE[i,j]+notas[i,j,k] //se usa 'mE' como el total de la suma de las notas 
				
			FinPara
			
			mE[i,j]=mE[i,j]/n //se hace la media de las notas(se usa 'mE' como media)
			decimales2(mE[i,j])// devuelve la media estdiantes con dos decimales
			
			mA[i]=mA[i]+mE[i,j] //se unsa 'mA' como total de las medias de los estudiantes
		FinPara
		
		mA[i]=mA[i]/e //se hace la media de la asignatura(se una 'mA' como media)	
		decimales2(mA[i]) // devuelve la media asignatura con dos decimales
	FinPara
	
FinFuncion

Algoritmo Cuestion_3
	
	definir a_max , e_max , n_max Como Entero  //la cantidad de asignaturas, estudiantes y notas maximas de un curso , respectivamente
	a_max=10 
	e_max=10
	n_max=10
	Dimension  estudiantes[e_max] ,asignaturas[a_max] ,notas[a_max,e_max,n_max] ,media_A[a_max] ,media_E[a_max,e_max] 
	definir notas ,media_A ,media_E Como Real
	Definir estudiantes , asignaturas Como Caracter
	// notas[asignatura,estudiantes,notas]---> la nota de cada estudiante de cada asignatura
	//media_A[asignaturas] --> media de al asginatura
	//media_E[asiganutas,estudiante] --> media del estudiante en cada asignatura
	definir num_a ,num_e ,num_n como entero
	//num_a -->num de asignaturas
	//num_e-->num de estudiantes
	//num_n --> num de examenes(notas)
	
	decidir(num_n)
	
	// para no estar todo el dia con la comprobación
	num_a=3 
	rellenarAsig(asignaturas)
	num_e=3
	rellenarEstud(estudiantes)
	//--------------------
	
	
	Escribir "-----------------------------------------------------"
	rellenarNotas(notas ,asignaturas ,estudiantes ,num_a ,num_e ,num_n)
	media(notas ,media_A ,media_E ,num_a ,num_e ,num_n)
	Escribir "-----------------------------------------------------"
	mostrarNotas(notas ,media_A ,media_E ,asignaturas ,estudiantes ,num_a ,num_e ,num_n)
	Escribir "-----------------------------------------------------"
	
	
FinAlgoritmo

