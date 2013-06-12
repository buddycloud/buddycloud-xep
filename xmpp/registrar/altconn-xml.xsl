<?xml version='1.0' encoding='UTF-8'?>
<!-- stylesheet for alternative connection methods -->
<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'>
<xsl:output method='xml' indent='yes'/>

  <xsl:template match='/'>
    <registry type='alt-connections'>
      <xsl:apply-templates select='/registry/method'/>
    </registry>
  </xsl:template>

  <xsl:template match='method'>
    <method>
      <name><xsl:value-of select='name'/></name>
      <desc><xsl:value-of select='desc'/></desc>
      <syntax><xsl:value-of select='syntax'/></syntax>
      <doc><xsl:value-of select='doc'/></doc>
    </method>
  </xsl:template>

</xsl:stylesheet>
