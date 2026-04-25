
<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:include href="http://uax.tionazo.es/26/template_servicios.xsl" />

  <!-- Template raíz o principal -->
  <xsl:template match="/">
    <html>
      <body>
        <h1>Infraestructura</h1>

        <h2>Servidores</h2>
        <!-- Template servidores ... -->
        <xsl:apply-templates select="infraestructura/servidor" />
        <!-- fin de template de servidores -->


        <h2>Usuarios</h2>
        <table border="1">
          <thead>
            <tr>
              <th>ID</th>
              <th>Nombre</th>
              <th>Rol</th>
              <th>Activo</th>
            </tr>
          </thead>
          <tbody>            
          <!-- Template usuarios ... -->
          <xsl:apply-templates select="infraestructura/usuarios/usuario" />
          <!-- fin de la llamada al template de cada usuario -->
          </tbody>
        </table>
      </body>
    </html>
        
  </xsl:template> <!-- fin del template principal -->


  <!-- Templates de cada elemento a repetir -->

  <!-- Template para cada usuario -->
  <xsl:template match="usuario">
    <tr>
      <td><strong><xsl:value-of select="@id" /></strong></td>
      <td><!-- nombre --> <xsl:value-of select="nombre" /> </td>
      <td><!-- rol --> <xsl:value-of select="@rol" /> </td>
      <td><!-- activo --> <xsl:value-of select="activo" /> </td>
    </tr>
  </xsl:template>


  <!-- Template para cada servidor -->
  <xsl:template match="servidor">
    <h3>
      <xsl:value-of select="nombre" />
    </h3>
    <ul>
      <li>ID: <xsl:value-of select="@id" /></li>
      <li>Tipo: <xsl:value-of select="@tipo" /></li>
      <li>IP: <xsl:value-of select="ip" /></li>
      <li>estado: <xsl:value-of select="estado" /></li>
    </ul>

    <h4>Servicios</h4>
    <ul>
      <!-- aplicamos o llamamos a la plantilla de servicio -->
      <xsl:apply-templates select="servicios/servicio" />
    </ul>

  </xsl:template>



</xsl:stylesheet>