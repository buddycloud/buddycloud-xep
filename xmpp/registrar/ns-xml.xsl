<?xml version='1.0' encoding='UTF-8'?>
<!-- stylesheet for registered namespaces -->
<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'>
<xsl:output method='xml' indent='yes'/>

  <xsl:template match='/'>
    <registry type='namespaces'>
      <xsl:apply-templates select='/registry/ns'/>
    </registry>
  </xsl:template>

  <xsl:template match='ns'>
    <ns>
      <name><xsl:value-of select='name'/></name>
      <doc><xsl:value-of select='doc'/></doc>
    </ns>
  </xsl:template>

</xsl:stylesheet>
