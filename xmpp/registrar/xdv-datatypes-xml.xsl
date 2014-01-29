<?xml version='1.0' encoding='UTF-8'?>
<!-- stylesheet for x:data validation datatypes -->
<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'>
<xsl:output method='xml' indent='yes'/>

  <xsl:template match='/'>
    <registry type='xdv-datatypes'>
      <xsl:apply-templates select='/registry/datatype'/>
    </registry>
  </xsl:template>

  <xsl:template match='datatype'>
    <datatype>
      <name><xsl:value-of select='name'/></name>
      <desc><xsl:value-of select='desc'/></desc>
      <doc><xsl:value-of select='doc'/></doc>
      <methods><xsl:value-of select='methods'/></methods>
      <min><xsl:value-of select='min'/></min>
      <max><xsl:value-of select='max'/></max>
    </datatype>
  </xsl:template>

</xsl:stylesheet>
