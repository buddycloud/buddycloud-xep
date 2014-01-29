<?xml version='1.0' encoding='UTF-8'?>
<!-- stylesheet for disco feature vars -->
<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'>
<xsl:output method='xml' indent='yes'/>

  <xsl:template match='/'>
    <registry type='disco-features'>
      <xsl:apply-templates select='/registry/var'/>
    </registry>
  </xsl:template>

  <xsl:template match='var'>
    <var>
      <name><xsl:value-of select='name'/></name>
      <desc><xsl:value-of select='desc'/></desc>
      <doc><xsl:value-of select='doc'/></doc>
    </var>
  </xsl:template>

</xsl:stylesheet>
