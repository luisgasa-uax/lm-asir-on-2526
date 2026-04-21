---
slides: true
theme: simple-uax
highlightTheme: dracula-tnz
custom_header: "'<link rel=\"icon\" href=\"https://ejemplo.com/tu-favicon.ico\">'"
marp: true
titulo: Sesión 6 - Transformaciones XSLT e Intro a XPath
modulo: Lenguajes de Marcas y Sistemas de Gestión de la Información
ciclo: ASIR
unidad: HTML y CSS
sesion: 6
estado: listo
tipo: diapositivas
formato: slides-extended
creada: 2026-04-14
tags:
  - docencia
  - asir
  - lenguajes-de-marcas
  - html
  - css
  - flexbox
  - obsidian
  - slides
  - xslt
  - xpath
---
# XPath + XSLT
## Sesión 6

---

## ¿Qué es XPath?

Lenguaje para **navegar y consultar XML**

Permite:
- Seleccionar nodos
- Filtrar datos
- Acceder a valores concretos

---

## XPath → idea mental

XML = árbol

XPath = rutas dentro del árbol

Ejemplo:
```xml
/servicios/servicio/nombre
```

---

## Selección básica

```xml
/raiz/hijo
```

Selecciona:

- Hijos directos
    

Ejemplo:

```xml
/servicios/servicio
```

---

## Selección global

```xml
//nombre
```

Selecciona:

- Todos los nodos con ese nombre
    

---

## Selección por posición

```xml
/servicios/servicio[1]
```

Selecciona:

- Primer elemento
    

Otros:

- `[last()]`
    
- `[2]`
    

---

## Selección por condición

```xml
/servicios/servicio[@puerto=22]
```

Filtra:

- Por valor de un hijo
    

---

## Selección de hijos concretos

```xml
/servicios/servicio/nombre
```

Devuelve:

- Solo los nombres
    

---

## Ejercicio rápido

XML:

```xml
<alumnos>
  <alumno>
    <nombre>Ana</nombre>
  </alumno>
  <alumno>
    <nombre>Luis</nombre>
  </alumno>
</alumnos>
```

👉 Selecciona todos los nombres

---

## Ejercicio rápido

XML:

```xml
<usuarios>
  <usuario>
    <edad>18</edad>
  </usuario>
  <usuario>
    <edad>25</edad>
  </usuario>
</usuarios>
```

👉 Selecciona usuarios con edad 25

---

## Ejercicio 2: Infraestructura

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
`  /infraestructura/servidor[@id="srv01"]/nombre`


2. Obtener el puerto del servicio nginx del servidor web
  `/infraestructura/servidor[@tipo='web']/servicios/servicio[nombre='nginx']/puerto`

  `/ruta/nodo[@atributo='valor_atributo']/nodo/nodo[nodo_hijo='valor_de_nodo_hijo']/nodo_que_buscamos`

  - Cuando ponemos una @ nos referimos a un atributo
  - Cuando no ponemos @ nos referimos al valor del nodo

3. Obtener el protocolo del servicio ssh del servidor tipo web
  `/infraestructura/servidor[@tipo='web']/servicios/servicio[nombre='ssh']/protocolo`


4. Obtener todos los nombres de los servidores
  `/infraestructura/servidor/nombre`


5. Obtener todos los puertos de los servicios
 `//puerto`
  


6. Obtener el primer servidor


7. Obtener el último usuario


8. Obtener servidores en estado activo


9. Obtener los usuarios activos




---
# XSLT

---

## ¿Qué es XSLT?

Lenguaje para:  
👉 Transformar XML en otro formato

Ejemplo:

- XML → HTML
- XML → texto

---

## Estructura básica XSLT

```xml
<xsl:stylesheet>
  <xsl:template match="/">
  </xsl:template>
</xsl:stylesheet>
```

---

## Plantillas (template)

```xml
<xsl:template match="servicio">
```

Define:

- Qué hacer con cada nodo
    

---

## Uso de XPath en XSLT

```xml
<xsl:value-of select="nombre"/>
```

👉 XPath dentro de XSLT

---

## Bucle con for-each

```xml
<xsl:for-each select="servicios/servicio">
```

👉 Recorre nodos

---

## Ejemplo completo

```xml
<xsl:for-each select="servicios/servicio">
  <p>
    <xsl:value-of select="nombre"/>
  </p>
</xsl:for-each>
```

---

## Ejercicio rápido

Dado un XML de productos:

👉 Mostrar nombres en HTML

---

# Resumen clave

---

## XPath (EXAMEN)

- `/` → ruta exacta
    
- `//` → búsqueda global
    
- `(ruta)[condición]` → filtro
    
- `(ruta)[n]` → posición
    

---

## XSLT (IDEA)

- Usa XPath
    
- Permite transformar XML
    
- No memorizar → entender
    

---

## Cierre

👉 Si sabes:

- Seleccionar nodos
    
- Filtrar por condiciones
    

👉 Apruebas XPath
