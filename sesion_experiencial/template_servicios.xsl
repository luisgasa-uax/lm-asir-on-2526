
<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- Template de servicios -->
  <xsl:template match="servicio">
    <li>
      <xsl:value-of select="nombre" />
      <ul>
        <li>Puerto: <xsl:value-of select="puerto" /></li>
        <li>Protocolo: <xsl:value-of select="protocolo" /></li>
        <li>Estado: <xsl:value-of select="estado" /></li>
      </ul>
    </li>
  </xsl:template>

  </xsl:stylesheet> 
  