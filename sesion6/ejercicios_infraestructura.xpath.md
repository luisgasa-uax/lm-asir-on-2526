
## Ejercicio XPath 2: Infraestructura

```xml
<?xml version="1.0" encoding="UTF-8"?>

<infraestructura>
    
    <servidor id="srv01" tipo="web">
        <nombre>Servidor Web Principal</nombre>
        <ip>192.168.1.10</ip>
        <estado>activo</estado>
        
        <servicios>
            <servicio>
                <nombre>nginx</nombre>
                <puerto>80</puerto>
                <protocolo>http</protocolo>
                <estado>activo</estado>
            </servicio>
            
            <servicio>
                <nombre>ssh</nombre>
                <puerto>22</puerto>
                <protocolo>tcp</protocolo>
                <estado>activo</estado>
            </servicio>
        </servicios>
    </servidor>

    <servidor id="srv02" tipo="bbdd">
        <nombre>Servidor Base de Datos</nombre>
        <ip>192.168.1.20</ip>
        <estado>activo</estado>
        
        <servicios>
            <servicio>
                <nombre>mysql</nombre>
                <puerto>3306</puerto>
                <protocolo>tcp</protocolo>
                <estado>activo</estado>
            </servicio>
        </servicios>
    </servidor>

    <servidor id="srv03" tipo="ftp">
        <nombre>Servidor FTP</nombre>
        <ip>192.168.1.30</ip>
        <estado>mantenimiento</estado>
        
        <servicios>
            <servicio>
                <nombre>ftp</nombre>
                <puerto>21</puerto>
                <protocolo>tcp</protocolo>
                <estado>detenido</estado>
            </servicio>
        </servicios>
    </servidor>

    <usuarios>
        <usuario id="u01" rol="admin">
            <nombre>Ana</nombre>
            <activo>true</activo>
        </usuario>
        
        <usuario id="u02" rol="tecnico">
            <nombre>Luis</nombre>
            <activo>true</activo>
        </usuario>
        
        <usuario id="u03" rol="invitado">
            <nombre>Carlos</nombre>
            <activo>false</activo>
        </usuario>
    </usuarios>

</infraestructura>

```

---

### Ejercicios "infraestructura.xml"

1. Obtener el nombre del servidor web principal
2. Obtener el puerto del servicio nginx del servidor web
3. Obtener el protocolo del servicio ssh del servidor tipo web
4. Obtener todos los nombres de los servidores
5. Obtener todos los puertos de los servicios
6. Obtener el primer servidor
7. Obtener el último usuario
8. Obtener servidores en estado activo
9. Obtener los usuarios activos

--- 
#### Soluciones:

##### 1. Obtener el nombre del servidor web principal
```xml
/infraestructura/servidor[@id="srv01"]/nombre
```

---

##### 2. Obtener el puerto del servicio nginx del servidor web
```xml
/infraestructura/servidor[@tipo='web']/servicios/servicio[nombre='nginx']/puerto
```
Explicación: 
```xml
/ruta/nodo[@atributo='valor_atributo']/nodo/nodo[nodo_hijo='valor_de_nodo_hijo']/nodo_que_buscamos
```
  - Cuando ponemos una @ nos referimos a un atributo
  - Cuando NO ponemos @ nos referimos al valor del nodo

---

##### 3. Obtener el protocolo del servicio ssh del servidor tipo web
```xml
/infraestructura/servidor[@tipo='web']/servicios/servicio[nombre='ssh']/protocolo
```

---

##### 4. Obtener todos los nombres de los servidores
```xml
/infraestructura/servidor/nombre
```

---

##### 5. Obtener todos los puertos de los servicios
```xml
//puerto
``` 
ó 

```xml
/infraestructura/servidor/servicios/servicio/puerto
```

---

##### 6. Obtener el primer servidor
```xml
(/infraestructura/servidor)[1]
```
ó
```xml
/infraestructura/servidor[1]
```

---

##### 7. Obtener el último usuario
```xml
/infraestructura/usuarios/usuario[last()]
```  
ó
```xml
/infraestructura/usuarios/usuario[3]
```  
ó
```xml
//usuario[3]
``` 
ó
```xml
//usuario[last()]
```

---

##### 8. Obtener servidores en estado activo
```xml
(/infraestructura/servidor)[estado='activo']
```
ó
```xml
//servidor[estado='activo']
```
Esta otra opción sólo nos devuelve el estado: 
```xml
//servidor/estado['activo']
```   

---

##### 9. Obtener los usuarios activos
```xml
//usuarios/usuario[activo='true']
``` 
ó
```xml
(/infraestructura/usuarios/usuario)[activo='true']
```
ó
```xml
//usuario[activo='true']
 ``` 
ó
```xml
/infraestructura/usuarios/usuario[activo='true']/nombre
```

---

>[!info] Ejemplo de prompt para solicitar este tipo de ejercios sobre XPath:
> ```
> Quiero practicar con XPATH
> 
> Dame un XML de temática [PON TU TEMA] 
> y una serie de ejercicios que contemple: 
> - consultas simples
> - búsqueda exacta 
> - búsqueda globaL 
> - filtro por posición 
> - filtro por último elemento 
> - filtro por valor de nodo 
> - filtro por valor de atributo
> Dame, al menos, dos ejercicios de cada tipo
> ```
> 

---