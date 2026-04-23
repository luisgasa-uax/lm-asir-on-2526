# Ejercicios XPath 
## XML de Infraestrucura

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
            <nombre>Alberto</nombre>
            <activo>true</activo>
        </usuario>
        
        <usuario id="u03" rol="invitado">
            <nombre>Carlos</nombre>
            <activo>false</activo>
        </usuario>
    </usuarios>

</infraestructura>
```

## 1. Obtener todos los nombres de los servicios 
```
/infraestructura/servidor/servicios/servicio/nombre
```

### 1.2. Obtener todos los nombres de los servicios utilizando selección global (//)
//servicio/nombre


## 2. Obtener todos los puertos de los servicios 
```
/infraestructura/servidor/servicios/servicio/puerto
```
ó 
```
//puerto
```

## 3. Obtener el primer servidor
```
//servidor[1]
```
ó 
```
/infraestructura/servidor[1]
```

## 3. Obtener el último servidor
```
//servidor[last()]

```

## 4. Obtener el último usuario
```
//usuario[last()]
```
ó
Con selección básica (ruta completa) 
```
/infraestructura/usuarios/usuario[last()]
```
ó (en este caso, como sabemos que tenemos sólo 3 usuarios ... )
```
//usuario[3]
```
```
/infraestructura/usuarios/usuario[3]
```

## 5. Obtener servidores en estado activo (filtro [nodo='valor'])
```
//servidor[estado="activo"]
```
ó 
```
/infraestructura/servidor[estado='activo']
```

## 6. Obtener el nombre de los servidores en estado activo 
```
/infraestructura/servidor[estado='activo']/nombre
```

```
//servidor[estado='activo']/nombre
```

## 7. Obtener el servidor de tipo bbdd (filtro corchetes atributo @)
```
/infraestructura/servidor[@tipo='bbdd']
```
ó 
```
//servidor[@tipo='bbdd']
```

## 8. Usuarios activos
```
//usuario [activo="true"]
```


## 9. Obtener el protocolo del servicio ssh del servidor tipo web
```
//servidor[@tipo='web']/servicios/servicio[nombre='ssh']/protocolo
```
ó 
```
//servidor[@tipo='web']//servicio[nombre='ssh']/protocolo
```

## 10. Obtener el puerto del servicio nginx del servidor web
```
//servidor[@tipo='web']//servicio[nombre='nginx']/puerto
```
ó 
```
/infraestructura/servidor[@tipo='web']/servicios/servicio[nombre='nginx']/puerto
```

## 11. Obtener el nombre del servidor web principal
```
//servidor[nombre='Servidor Web Principal']/nombre
```

## 12. Obtener el nombre y el protocolo del servicio mysql del servidor con id srv02
```
//servidor[@id='srv02']//servicio[nombre='mysql']/(nombre|protocolo)
```
ó 
```
//servidor[@id='srv01']//servicio/(nombre|protocolo)
```


---

Ejemplo de prompt para solicitar este tipo de ejercios sobre XPath:
Quiero practicar con XPATH

Dame un XML de temática [PON TU TEMA] 
y una serie de ejercicios que contemple: 
- consultas simples
- búsqueda exacta 
- búsqueda globaL 
- filtro por posición 
- filtro por último elemento 
- filtro por valor de nodo 
- filtro por valor de atributo
Dame, al menos, dos ejercicios de cada tipo