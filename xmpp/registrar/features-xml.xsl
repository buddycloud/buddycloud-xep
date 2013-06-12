<?xml version='1.0' encoding='UTF-8'?>
<!-- stylesheet for stream features -->
<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'>
<xsl:output method='xml' indent='yes'/>

  <xsl:template match='/'>
    <registry type='stream-features'>
      <xsl:apply-templates select='/registry/feature'/>
    </registry>
  </xsl:template>

  <xsl:template match='feature'>
    <feature>
      <ns><xsl:value-of select='name'/></ns>
      <name><xsl:value-of select='name'/></name>
      <element><xsl:value-of select='element'/></element>
      <desc><xsl:value-of select='desc'/></desc>
      <doc><xsl:value-of select='doc'/></doc>
    </feature>
  </xsl:template>

</xsl:stylesheet>
