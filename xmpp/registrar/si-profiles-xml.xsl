<?xml version='1.0' encoding='UTF-8'?>
<!-- stylesheet for stream initiation profiles registry -->
<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'>
<xsl:output method='xml' indent='yes'/>

  <xsl:template match='/'>
    <registry type='si-profiles'>
      <xsl:apply-templates select='/registry/profile'/>
    </registry>
  </xsl:template>

  <xsl:template match='profile'>
    <profile>
      <name><xsl:value-of select='name'/></name>
      <desc><xsl:value-of select='desc'/></desc>
      <doc><xsl:value-of select='doc'/></doc>
    </profile>
  </xsl:template>

</xsl:stylesheet>
