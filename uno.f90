!funcion para generar un numero aleatorio con parametros de entrada
!Esta funcion es la generada por el profesor de metodos numericos...
real function random(i,j,k)
	real rand
	real :: nal=0
	integer j
	integer*4 timearray(3)
	integer itring 
	parameter (itring=0)
	call itime(timearray)
		j=rand(timearray(i)+timearray(j)+timearray(k))
		nal=rand(0)
		random=nal
	return
end


Program MonteCarlo

implicit none
	
	!Variables enteras delimitadoras de la ciudad
	integer :: A=25,B=15

	!variable cambiante para random
	real nal

	!posiciones de tipo entero dentro de la ciudad
	integer  x,y

	!llamado a una variable de una funcion externa
	real ,external:: random

	!limite de iteracion
	integer :: n=350



	!variables de prioridad dentro de la ciudad
	integer :: cx0=40, cxa=55,cy0=25,cyb=95
	
	!Variables de ocurrencia
	integer :: oc1=0,oc2=0,oc3=0,oc4=0

	!variable de temperatura total
	real  caminototal

	
	!inicio de iteracion
	integer :: i=1
	
	!variable auxiliar para dar formato en impresion de coordenadas...
	integer j

	!Caracter para tener respuesta de repeticion de programa por parte del usuario
	character*1	sino

	!Variable logica
	logical Regresar

	!Valor de variable logica
	Regresar = .TRUE.

	do while (Regresar)

		write (*,*)"Este programa resolvera alguna cosa con el metodo de MonteCarlo..."
		write (*,*)

		!Esto es para que entre a la validacion de datos por parte de usuario
		x=-1
		y=-1

		!Esto es cuando acepte volver a ejecutar el programa las variables no se queden con valores de la ejecucion anterior
		caminototal=0.d0

		!Validacion de los puntos que ingresa el usuario deban estar dentro de la placa...
		do while ((x .lt. 0 .or. x .gt. A) .or. (y .lt. 0 .or. y .gt. B))
			write (*,*)"Se debe ingresar la ubicacion del viajero"
			write (*,*)"Dentro de un conjunto de coordenadas desde {(0,0)X(15,10)}"
			write (*,*)"Ingresa valor x:"
			read  (*,*)x
			write (*,*)"Ingresa valor y:"
			read  (*,*)y
			write (*,*)
		end do

		open(10,file='montecarlo.txt')

		write (10,*)
		write (10,*)"La coordenada inicial es:"
		write (10,*)("(",x,",",y,")",j=1,1)
		write (10,*)
		write (10,*)"Las posiciones del viajero por donde paso son:"
		write (10,*)"	(x, y)"
		write (10,*)

		do i=1,n

			nal=random(i,i*3,i*5)

			if(0.0 .lt.nal .and. nal.le. 0.25) then
				oc1=oc1+1
				y=y-1 
				
			else if(0.25 .lt.nal .and. nal.le. 0.5)then
				oc2=oc2+1
				y=y+1 

			else if (0.5 .lt.nal .and. nal.le. 0.75) then
				oc3=oc3+1	
				x=x-1 
   
			else if (0.75 .lt.nal .and. nal.le. 1) then
				oc4=oc4+1
				x=x+1  
			end if

			!Se validan los casos de incremento/decremento por si sobrepasan los limites de la placa
			if (x .lt.0) then
				x=1
			end if
			if (x .gt.A) then
				x=A-1
			end if
			if (y .lt.0) then
				y=1
			end if
			if (y .gt.B) then
				y=B-1
			end if

			write (10,*)("(",x,",",y,")",j=1,1) 

		end do

		write (10,*)
		write (10,*)"Tabla de Costos de ruta::"
		write (10,*)("C1:",oc1*100/n,", C2:",oc2*100/n,", C3:",oc3*100/n,", C4:",oc4*100/n,j=1,1)
		write (10,*)

		!Calculo de temperatura total:
		caminototal = ((oc1*cx0)+(oc2*cxa)+(oc3*cy0)+(oc4*cyb))/100.d0

		!Se muestra el resultado final del costo en movimientos del viajero
		write (10,*)"El costo del viaje total:",caminototal," Unidades."
		write (10,*)

		close(10)

		write (*,*)
		write (*,*)"Los resultados estan en el documento montecarlo.txt"
		write (*,*)"Quiere volver a ejecutar el programa?"
		write (*,*)"Ingresa N para salir."
		write (*,*)"Ingresa cualquier tecla para regresar."
		read (*,*) sino
		if (sino=="N") then
			Regresar = .FALSE.
		end if
	end do
	write (*,*)"Fin de ejecucion..."

End Program
