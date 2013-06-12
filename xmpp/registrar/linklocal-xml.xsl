<?xml version='1.0' encoding='UTF-8'?>
<!-- stylesheet for link-local messaging TXT records -->
<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'>
<xsl:output method='xml' indent='yes'/>

  <xsl:template match='/'>
    <registry type='linklocal'>
      <xsl:apply-templates select='/registry/record'/>
    </registry>
  </xsl:template>

  <xsl:template match='param'>
    <param>
      <name><xsl:value-of select='name'/></name>
      <desc><xsl:value-of select='desc'/></desc>
      <status><xsl:value-of select='status'/></status>
    </param>
  </xsl:template>

</xsl:stylesheet>
