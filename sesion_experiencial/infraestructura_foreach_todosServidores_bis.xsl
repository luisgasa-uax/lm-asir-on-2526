
<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template match="/">
    <html>
      <body>
        <h1>Infraestructura</h1>

        <h2>Servidores</h2>
        <xsl:for-each select="infraestructura/servidor" >
          <h3>
            <xsl:value-of select="nombre" />
          </h3>
          <ul>
            <li> id-servidor: <xsl:value-of select="@id" /></li>
            <li> tipo-servidor: <xsl:value-of select="@tipo" /></li>
            <li>IP: <xsl:value-of select="ip" />
            </li>
            <li>estado: <xsl:value-of select="estado" /></li>
          </ul>
          
          <h4>Servicios</h4>
          <ul>
            <!-- arrancamos bucle-->
            <xsl:for-each select="servicios/servicio">
              <li>Nombre servicio:<xsl:value-of select="nombre" />
                <!-- Nombre de servicio -->
                          <ul>
                  <li>Puerto: <xsl:value-of select="puerto" /> <!-- consulta
                                  xlst --></li>
                  <li>Protocolo: <xsl:value-of select="protocolo" /><!--
                                  consulta xlst --></li>
                  <li>Estado: <xsl:value-of select="estado" /><!-- consulta
                                  xlst --></li>
                </ul>
              </li>
            </xsl:for-each>
            <!-- terminamos bucle-->

        </ul>

        </xsl:for-each>
        <!-- fin del bucle de servidores -->

        <h2>Usuarios</h2>
        <!-- tabla con las columnas Titulo (id, rol, activo) y Valor (el valor correspondiente al nodo) -->
        <!-- Etiquetas para las tablas: table, thead, tr, th, tbody, td -->

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
            <!-- abrimos bucle -->

              <td><!-- id --></td>
              <td><!-- nombre --></td>
              <td><!-- rol --></td>
              <td><!-- activo --></td>

            <!-- cerramos bucle -->
          </tbody>
        </table>

      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>