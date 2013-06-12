<?xml version='1.0' encoding='UTF-8'?>
<!-- stylesheet for x:data validation prefixes -->
<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'>
<xsl:output method='xml' indent='yes'/>

  <xsl:template match='/'>
    <registry type='xdv-prefixes'>
      <xsl:apply-templates select='/registry/datatype-prefix'/>
    </registry>
  </xsl:template>

  <xsl:template match='datatype-prefix'>
    <datatype-prefix>
      <prefix><xsl:value-of select='prefix'/></prefix>
      <desc><xsl:value-of select='desc'/></desc>
      <doc><xsl:value-of select='doc'/></doc>
    </datatype-prefix>
  </xsl:template>

</xsl:stylesheet>
