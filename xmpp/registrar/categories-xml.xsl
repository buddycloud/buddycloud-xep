<?xml version='1.0' encoding='UTF-8'?>
<!-- stylesheet for service discovery categories -->
<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'>
<xsl:output method='xml' indent='yes'/>

  <xsl:template match='/'>
    <registry type='disco-categories'>
      <xsl:apply-templates select='/registry/category'/>
    </registry>
  </xsl:template>

  <xsl:template match='category'>
    <category>
      <name><xsl:value-of select='name'/></name>
      <desc><xsl:value-of select='desc'/></desc>
      <xsl:apply-templates select='type'/>
    </category>
  </xsl:template>

  <xsl:template match='type'>
    <type>
      <name><xsl:value-of select='name'/></name>
      <desc><xsl:value-of select='desc'/></desc>
      <doc><xsl:value-of select='doc'/></doc>
    </type>
  </xsl:template>

</xsl:stylesheet>
