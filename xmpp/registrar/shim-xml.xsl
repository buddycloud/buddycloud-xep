<?xml version='1.0' encoding='UTF-8'?>
<!-- stylesheet for SHIM headers -->
<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'>
<xsl:output method='xml' indent='yes'/>

  <xsl:template match='/'>
    <registry type='shim'>
      <xsl:apply-templates select='/registry/header'/>
    </registry>
  </xsl:template>

  <xsl:template match='header'>
    <header>
      <name><xsl:value-of select='name'/></name>
      <desc><xsl:value-of select='desc'/></desc>
      <doc><xsl:value-of select='doc'/></doc>
    </header>
  </xsl:template>

</xsl:stylesheet>
