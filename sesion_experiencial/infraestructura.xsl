<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template match="/">
    

    <html lang="es">
    <head>
      <title>Infraestructura</title>
    </head>
    <body>
      <h1>Transformación de XML</h1>
      <p>Este es un ejemplo de transformación de XML utilizando XSLT.</p>      
    
      <h2>Contenido del XML</h2>
      <p>
        <xsl:apply-templates select="infraestructura/*" />        
      </p>
    </body>
    </html>
  
    </xsl:template>

</xsl:stylesheet>
