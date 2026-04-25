
<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:template match="/">
  <html>
      <body>
          <h1>Infraestructura</h1>

          <h2>Servidores</h2>
          
          <h3>
            <xsl:value-of select="infraestructura/servidor[1]/nombre" />
          </h3>
          <ul>
            <li>Id: <xsl:value-of select="infraestructura/servidor[1]/@id" /></li>
            <li>Tipo: <xsl:value-of select="infraestructura/servidor[1]/@tipo" /></li>
            <li>IP: <xsl:value-of select="//servidor[1]/ip" /> </li>
            <li>estado: <xsl:value-of select="//servidor[1]/estado" /></li>
          </ul>
          <h4>Servicios</h4>
          <ul>

            <!-- arrancamos bucle -->
            <xsl:for-each select="//servidor[1]/servicios/servicio" >
              <li>
                <xsl:value-of select="nombre" />
                <ul>
                  <li>Puerto: <xsl:value-of select="puerto" />  </li>

                  <li>Protocolo: <xsl:value-of select="protocolo" /></li>

                  <li>Estado:  <xsl:value-of select="estado" /></li>
                </ul>
              </li>
            </xsl:for-each>
            <!-- terminamos bucle -->

          </ul>

      </body>
  </html>
</xsl:template>

</xsl:stylesheet>
