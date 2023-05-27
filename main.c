#include <stdio.h>
#include <stdlib.h>
#include "nodo_abb.h"

extern void agregar_abb(void *nodo, int valor);
extern void mostrar_abb(void *nodo);

int main(int argc, char *argv[])
{
    struct nodo_abb raiz;
    raiz.valor = 0;
    raiz.izq = NULL;
    raiz.der = NULL;
    int n = 0;
    int entrada=0;

    printf("Organizacion del Computador II\n");
    
    printf("Tenga en cuenta que: dependiendo del valor que elija para su raiz\nse van a ordenar en un arbol binario los numeros de la siguiente lista \n");
	
    printf("{ 6 , 9 , 13 , 17 , 20 , 64 }\n");
    
    printf("Ingrese el valor de la raiz: ");
    
        //asigno el valor entero que pasa por parametro 
                entrada = scanf("%d",&n);
                if(entrada ==1){  
                	raiz.valor = n;
                }else{
                printf("El valor ingresado no es correcto, se asignara un valor intermedio para la raiz de 15\n");
                
                	raiz.valor =15;
		}	    	
            
	//asignacion manual de los valores de los nodos
	    int nuevo_valor1 = 9;
	    agregar_abb(&raiz, nuevo_valor1);
    
	    int nuevo_valor2 = 20;
	    agregar_abb(&raiz, nuevo_valor2);
    
	    int nuevo_valor3 = 6;
	    agregar_abb(&raiz, nuevo_valor3);
    
	    int nuevo_valor4 = 17;
	    agregar_abb(&raiz, nuevo_valor4);
    
	    int nuevo_valor5 = 13;
	    agregar_abb(&raiz, nuevo_valor5);
    
	    int nuevo_valor6 = 64;
	    agregar_abb(&raiz, nuevo_valor6);
	
	
    //llamo a la funcion/etiqueta de NASM 
    mostrar_abb(&raiz);
	printf("\n");
    

    return 0;
}

